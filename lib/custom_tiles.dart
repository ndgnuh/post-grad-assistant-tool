import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_widgets.dart';

class StringTile extends StatefulWidget {
  final String titleText;
  final Widget? leading;
  final String initialValue;
  final ValueNotifier<String>? valueNotifier;
  final ValueChanged<String>? onUpdate;

  const StringTile({
    super.key,
    required this.titleText,
    this.onUpdate,
    this.valueNotifier,
    this.leading,
    this.initialValue = "",
  });

  @override
  State<StringTile> createState() => _StringTileState();
}

class _StringTileState extends State<StringTile> {
  late ValueNotifier<String> valueNotifier;

  String get value => valueNotifier.value;

  @override
  initState() {
    super.initState();
    valueNotifier = switch (widget.valueNotifier) {
      null => ValueNotifier(widget.initialValue),
      ValueNotifier<String> notifier => notifier,
    };

    valueNotifier.addListener(() => setState(() {}));
  }

  @override
  dispose() {
    super.dispose();
    valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleText = widget.titleText;
    final messenger = ScaffoldMessenger.of(context);

    void copyCurrentValue() {
      final data = ClipboardData(text: value);
      Clipboard.setData(data);
      messenger.showMessage("Copied $value");
    }

    return ListTile(
      title: Text(titleText),
      subtitle: Text(valueNotifier.value),
      leading: widget.leading,
      trailing: IconButton(
        icon: Icon(Icons.copy),
        onPressed: copyCurrentValue,
      ),
      onLongPress: copyCurrentValue,
      onTap: () async {
        String? newValue = await TextEditingDialog.show(
          title: titleText,
          context: context,
          initialValue: value,
        );

        switch (newValue) {
          case String newString:
            valueNotifier.value = newString;
            if (widget.onUpdate is ValueChanged<String>) {
              widget.onUpdate!(newString);
            }
        }
      },
    );
  }
}
