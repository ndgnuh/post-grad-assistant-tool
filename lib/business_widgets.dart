import 'package:flutter/material.dart';

import './business/domain_objects.dart';

class TextEditDialog extends StatelessWidget {
  final String title;
  final String? initialText;
  final IconData? icon;
  final void Function(String) onSubmit;

  static void show(
    BuildContext context, {
    required String title,
    String? initialText,
    IconData? icon,
    required void Function(String) onSubmit,
  }) {
    showDialog(
      context: context,
      builder: (context) => TextEditDialog(
        title: title,
        initialText: initialText,
        icon: icon,
        onSubmit: onSubmit,
      ),
    );
  }

  const TextEditDialog({
    super.key,
    required this.title,
    this.initialText,
    this.icon,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialText);
    final focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    return AlertDialog(
      title: Text(title),
      content: TextField(
        focusNode: focusNode,
        controller: controller,
        maxLines: null,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Nhập nội dung...",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Hủy"),
        ),
        TextButton(
          onPressed: () {
            onSubmit(controller.text);
            Navigator.of(context).pop();
          },
          child: const Text("Lưu"),
        ),
      ],
    );
  }
}

class DialogSelectGender extends StatelessWidget {
  final GioiTinh? initialGender;
  final void Function(GioiTinh?) onSelect;
  const DialogSelectGender({
    super.key,
    this.initialGender,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Chọn giới tính"),
      children: [
        RadioListTile<GioiTinh?>(
          groupValue: initialGender,
          value: GioiTinh.nam,
          title: const Text("Nam"),
          onChanged: (value) {
            onSelect(value);
            Navigator.of(context).pop();
          },
        ),
        RadioListTile<GioiTinh?>(
          groupValue: initialGender,
          value: GioiTinh.nu,
          title: const Text("Nữ"),
          onChanged: (value) {
            onSelect(value);
            Navigator.of(context).pop();
          },
        ),
        RadioListTile<GioiTinh?>(
          groupValue: initialGender,
          value: null,
          title: const Text("Không xác định"),
          onChanged: (value) {
            onSelect(value);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class GenderSelectionListTile extends StatefulWidget {
  final GioiTinh? initialGender;
  final ValueChanged<GioiTinh?>? onSelect;
  final Widget? leading;
  const GenderSelectionListTile({
    super.key,
    this.initialGender,
    this.onSelect,
    this.leading,
  });

  @override
  State<GenderSelectionListTile> createState() =>
      _GenderSelectionListTileState();
}

class _GenderSelectionListTileState extends State<GenderSelectionListTile> {
  late GioiTinh? gender;

  @override
  initState() {
    super.initState();
    gender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    final callback = widget.onSelect ?? (GioiTinh? newGender) {};
    return ListTile(
      title: const Text("Giới tính"),
      leading: widget.leading,
      subtitle: Text(switch (gender) {
        GioiTinh.nam => "Nam",
        GioiTinh.nu => "Nữ",
        null => "Không xác định",
      }),
      onTap: () => showDialog(
        context: context,
        builder: (context) => DialogSelectGender(
          initialGender: gender,
          onSelect: (GioiTinh? newGender) {
            setState(() {
              gender = newGender;
            });
            callback(newGender);
          },
        ),
      ),
    );
  }
}
