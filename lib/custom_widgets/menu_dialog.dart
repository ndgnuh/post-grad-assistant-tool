import 'package:flutter/material.dart';
import 'dart:async';

@immutable
sealed class AbstractMenuDialogItem {
  const AbstractMenuDialogItem();
}

/// Dialog action for [MenuDialog].
/// Each action can have a [title], an optional [subtitle],
/// an optional [icon],
/// and a function [onTap] that will be called when the action is tapped.
@immutable
class MenuDialogItem extends AbstractMenuDialogItem {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final FutureOr<void> Function()? onTap;

  const MenuDialogItem({
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
  });
}

/// Render a divider in the dialog.
@immutable
class MenuDialogDivider extends AbstractMenuDialogItem {
  const MenuDialogDivider();
}

/// Show a dialog with list of actions.
/// The action are defined by [MenuDialogItem].
Future<void> showMenuDialog(
  BuildContext context, {
  required List<AbstractMenuDialogItem> items,
  bool dismissFirst = true,
}) async {
  return await showDialog<void>(
    context: context,
    builder: (context) => MenuDialog(items: items, dismissFirst: dismissFirst),
  );
}

class MenuDialog extends StatelessWidget {
  final List<AbstractMenuDialogItem> items;
  final bool dismissFirst;

  const MenuDialog({
    super.key,
    required this.items,
    this.dismissFirst = true,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return FocusScope(
      child: SimpleDialog(
        clipBehavior: Clip.antiAlias,
        children: [
          for (final action in items)
            switch (action) {
              MenuDialogDivider() => const Divider(height: 1),
              MenuDialogItem() => ListTile(
                key: ValueKey(action),
                title: Text(action.title),
                subtitle: (action.subtitle is String)
                    ? Text(action.subtitle!)
                    : null,
                leading: (action.icon != null) ? Icon(action.icon) : null,
                onTap: () async {
                  if (dismissFirst) navigator.pop();
                  switch (action.onTap) {
                    case Function callback:
                      await callback();
                    default:
                      break;
                  }
                  if (!dismissFirst) navigator.pop();
                },
              ),
            },
        ],
      ),
    );
  }
}
