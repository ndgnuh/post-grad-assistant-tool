import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerInput extends StatelessWidget {
  final Key? formKey;
  final String label;
  final String? selectedFile;
  final String? hintText;
  final bool save;
  final bool directory;
  final List<String>? allowedExtensions;
  final String? dialogTitle;
  final Function(String) onSelected;

  const FilePickerInput({
    super.key,
    required this.onSelected,
    this.formKey,
    this.selectedFile,
    this.allowedExtensions,
    this.dialogTitle,
    this.hintText,
    this.label = "Select file",
    this.save = false,
    this.directory = false,
  });

  Future<void> runSave() async {
    String? file = await FilePicker.platform.saveFile(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      dialogTitle: dialogTitle,
    );
    switch (file) {
      case String file:
        onSelected(file);
    }
  }

  Future<void> runLoad() async {
    print(allowedExtensions);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      dialogTitle: dialogTitle,
    );
    switch (result?.paths) {
      case [String file]: // only file
        onSelected(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController.fromValue(
      TextEditingValue(text: selectedFile ?? ""),
    );
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText ?? "Tap to select a file",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onTap: () async {
        switch (save) {
          case true:
            await runSave();
          case false:
            await runLoad();
        }
      },
      readOnly: true,
    );
  }
}
