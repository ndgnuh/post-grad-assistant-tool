import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_symbols_icons/symbols.dart';

export 'custom_tiles/string_tile.dart';

/// Chế độ của widget
enum OperationMode { viewing, editing }

/// Get icon based on the operation mode
/// For [viewing] mode, return copy icon
/// For [editing] mode, return edit icon
IconData getIcon(OperationMode mode) {
  switch (mode) {
    case OperationMode.viewing:
      return Symbols.content_copy;
    case OperationMode.editing:
      return Symbols.edit;
  }
}

/// A tile that displays a string value and allows editing based on the mode
abstract class InformationTile<T> extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  final T value;
  final OperationMode mode;
  final ValueChanged<T>? onChanged;
  final VoidCallback? onDelete;

  final Widget deleteConfirmationMessage;
  final Widget cannotDeleteMessage;
  final Widget cannotEditMessage;

  /// Build the dialog that edit the value and call [onChanged] when done
  Widget buildEditingDialog(BuildContext context);

  /// Format the value to string for display
  String valueFormatter(T value);

  const InformationTile({
    super.key,
    required this.title,
    required this.value,
    this.mode = OperationMode.viewing,
    this.onChanged,
    this.onDelete,
    this.leading,
    this.trailing,
    this.deleteConfirmationMessage = const Text("Xóa?"),
    this.cannotDeleteMessage = const Text("Không thể xóa mục này"),
    this.cannotEditMessage = const Text("Không thể chỉnh sửa mục này"),
  });

  @override
  Widget build(BuildContext context) {
    final subtitle = Text(valueFormatter(value));
    final trailing = this.trailing ?? Icon(getIcon(mode));

    final actions = <Type, Action<Intent>>{
      CopyIntent: CopyAction(
        context: context,
        text: valueFormatter(value),
      ),
      EditIntent: EditAction<T>(
        buildEditingDialog: buildEditingDialog,
        context: context,
        onChanged: onChanged,
        cannotEditMessage: cannotEditMessage,
      ),
      DeleteIntent: DeleteAction(
        context: context,
        onDelete: onDelete,
        deleteConfirmationMessage: deleteConfirmationMessage,
        cannotDeleteMessage: cannotDeleteMessage,
      ),
    };

    return Actions(
      actions: actions,
      child: Builder(
        builder: (context) {
          return switch (mode) {
            OperationMode.editing => ListTile(
              title: title,
              subtitle: subtitle,
              trailing: trailing,
              leading: leading,
              onLongPress: () => Actions.invoke(context, DeleteIntent()),
              onTap: () => Actions.invoke(context, EditIntent()),
            ),
            OperationMode.viewing => ListTile(
              title: title,
              subtitle: subtitle,
              trailing: trailing,
              leading: leading,
              onTap: () => Actions.invoke(context, CopyIntent()),
              onLongPress: () => Actions.invoke(context, EditIntent()),
            ),
          };
        },
      ),
    );
  }
}

class CopyIntent extends Intent {
  const CopyIntent();
}

class EditIntent extends Intent {
  const EditIntent();
}

class DeleteIntent extends Intent {
  const DeleteIntent();
}

class CopyAction extends Action<CopyIntent> {
  final BuildContext context;
  final String text;

  CopyAction({
    required this.context,
    required this.text,
  });

  @override
  Object? invoke(CopyIntent intent) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã copy "$text" vào clipboard')),
    );
    return null;
  }
}

class EditAction<T> extends Action<EditIntent> {
  final BuildContext context;
  final WidgetBuilder buildEditingDialog;
  final ValueChanged<T>? onChanged;
  final Widget cannotEditMessage;

  EditAction({
    required this.context,
    required this.buildEditingDialog,
    this.onChanged,
    required this.cannotEditMessage,
  });

  @override
  Object? invoke(EditIntent intent) {
    if (onChanged == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: cannotEditMessage),
      );
      return null;
    }
    showDialog(
      context: context,
      builder: (context) => buildEditingDialog(context),
    );
    return null;
  }
}

class DeleteAction extends Action<DeleteIntent> {
  final BuildContext context;
  final VoidCallback? onDelete;
  final Widget deleteConfirmationMessage;
  final Widget cannotDeleteMessage;

  DeleteAction({
    required this.context,
    this.onDelete,
    required this.deleteConfirmationMessage,
    required this.cannotDeleteMessage,
  });

  @override
  Object? invoke(DeleteIntent intent) {
    final messenger = ScaffoldMessenger.of(context);
    if (onDelete == null) {
      messenger.showSnackBar(SnackBar(content: cannotDeleteMessage));
      return null;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: deleteConfirmationMessage,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onDelete!();
            },
            child: Text('Xóa'),
          ),
        ],
      ),
    );
    return null;
  }
}
