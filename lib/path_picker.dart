// Select a database in a selected directory...
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'custom_widgets.dart';

Future<String?> pickFilePathMobile({
  required BuildContext context,
  Set<String>? allowedExtensions,
}) async {
  final messenger = ScaffoldMessenger.of(context);
  final granted1 = await Permission.storage.request();
  final granted2 = await Permission.manageExternalStorage.request();
  if (!granted1.isGranted && !granted2.isGranted) {
    messenger.showSnackBar(
      const SnackBar(content: Text("Chưa cấp quyền truy cập file")),
    );
    return null;
  }

  await showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text("Hướng dẫn"),
      content: Text(
        "Do hạn chế của Android/iOS, bạn cần chọn thư mục chứa file cần chọn, sau đó chọn file trong thư mục đó.",
      ),
      actions: [
        TextButton(
          onPressed: null,
          child: Text("OK"),
        ),
      ],
    ),
  );

  // Select root directory
  final rootDirectoryPath = await FilePicker.platform.getDirectoryPath();
  if (rootDirectoryPath == null) return null;

  // Pick a file in the selected directory
  final selectedPath = await Navigator.push<String?>(
    // ignore: use_build_context_synchronously
    context,
    MaterialPageRoute(
      builder: (context) => FilePathPicker(
        rootDirectoryPath: rootDirectoryPath,
        allowedExtensions: allowedExtensions,
        onSelected: (filePath) => {},
      ),
    ),
  );
  return selectedPath;
}

Future<String?> pickFilePath({
  required BuildContext context,
  Set<String>? allowedExtensions,
}) async {
  if (Platform.isAndroid || Platform.isIOS) {
    return pickFilePathMobile(
      context: context,
      allowedExtensions: allowedExtensions,
    );
  }

  final results = await FilePicker.platform.pickFiles(
    dialogTitle: "Chọn file",
    allowedExtensions: allowedExtensions?.toList(),
    type: allowedExtensions != null ? FileType.custom : FileType.any,
    lockParentWindow: true,
  );
  if (results == null) return null;
  final filePath = results.paths.firstOrNull;
  return filePath;
}

class FilePathPicker extends StatefulWidget {
  final String title;
  final String rootDirectoryPath;
  final ValueChanged<String>? onSelected;
  final Set<String>? allowedExtensions;

  const FilePathPicker({
    super.key,
    required this.rootDirectoryPath,
    this.onSelected,
    this.allowedExtensions,
    this.title = "Chọn file",
  });

  @override
  State<FilePathPicker> createState() => _FilePathPickerState();
}

class _FilePathPickerState extends State<FilePathPicker> {
  List<String> paths = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text(widget.title),
        ),
      ),
      body: ConstrainedBody(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.gutter),
          child: CardSection(
            children: [
              for (final filePath in paths)
                ListTile(
                  title: Text(path.basename(filePath)),
                  subtitle: Text(filePath),
                  onTap: () {
                    widget.onSelected?.call(filePath);
                    Navigator.pop(context, filePath);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void initAsync() async {
    final directory = Directory(widget.rootDirectoryPath);
    final files = await directory.list().toList();

    // Filter files by allowed extensions if provided
    final filteredFiles = switch (widget.allowedExtensions) {
      null => files,
      Set<String> exts => files.where((file) {
        final matches = [
          for (final ext in exts)
            file.path.toLowerCase().endsWith(ext.toLowerCase()),
        ];
        final valid = matches.reduce((a, b) => a || b);
        return valid;
      }),
    };

    final paths = [
      for (final file in filteredFiles)
        path.join(widget.rootDirectoryPath, file.path),
    ];

    setState(() {
      this.paths = paths;
    });
  }

  @override
  void initState() {
    super.initState();
    initAsync();
  }
}
