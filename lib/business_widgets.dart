import 'package:flutter/material.dart';

import './business/domain_objects.dart';

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
