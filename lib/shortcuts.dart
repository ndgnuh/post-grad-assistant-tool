import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navigationKey = GlobalKey<NavigatorState>();
final searchAnchorKey = GlobalKey<State<SearchAnchor>>();
final scaffoldKey = GlobalKey<ScaffoldState>();
final globalFocusKey = GlobalKey<State<Focus>>();
final searchFieldKey = GlobalKey<State<TextField>>();
final shortcutStateKey = GlobalKey<State<CommonShortcuts>>();

class QuickActions {
  final String title;
  final IconData? icon;
  final VoidCallback? onPressed;

  QuickActions({
    required this.title,
    this.icon,
    this.onPressed,
  });
}

class CommonShortcuts extends StatefulWidget {
  final Widget child;
  final VoidCallback? onCreateNew;
  final VoidCallback? onSearch;
  final VoidCallback? onPaste;
  final VoidCallback? onImport;

  const CommonShortcuts({
    super.key,
    required this.child,
    this.onSearch,
    this.onPaste,
    this.onCreateNew,
    this.onImport,
  });

  @override
  State<CommonShortcuts> createState() => _CommonShortcutsState();
}

class _CommonShortcutsState extends State<CommonShortcuts> {
  VoidCallback? get onCreateNew => widget.onCreateNew;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CopyIntent extends Intent {
  const CopyIntent();
}

class SearchIntent extends Intent {
  const SearchIntent();
}

class EscapeIntent extends Intent {
  const EscapeIntent();
}

class OpenMenuIntent extends Intent {
  const OpenMenuIntent();
}

class GoBackIntent extends Intent {
  const GoBackIntent();
}

class CreateNewIntent extends Intent {
  const CreateNewIntent();
}

class GoBackAction extends Action<GoBackIntent> {
  @override
  Object? invoke(GoBackIntent intent) {
    final navigator = navigationKey.currentState!;
    print("Invoking GoBackAction");
    if (navigator.canPop()) {
      navigator.pop();
    } else {
      print("No route to pop");
    }
    return null;
  }
}

class SearchAction extends Action<SearchIntent> {
  final SearchController controller;

  SearchAction(this.controller);

  @override
  Object? invoke(SearchIntent intent) {
    print("Invoking SearchAction");
    controller.openView();
    return null;
  }
}

final keys = (
  ctrlF: LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyF),
  ctrlC: LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC),
  altLeft: LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.arrowLeft),
  esc: LogicalKeySet(LogicalKeyboardKey.escape),
  ctrlN: LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyN),
);

Map<LogicalKeySet, Intent> defaultShortcuts() => {
      keys.ctrlC: const CopyIntent(),
      keys.ctrlF: const SearchIntent(),
      keys.altLeft: const GoBackIntent(),
      keys.ctrlN: const CreateNewIntent(),
    };

class LoggingShortcutManager extends ShortcutManager {
  @override
  get shortcuts => defaultShortcuts();

  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    print('Handled shortcut $event in $context');
    if (result == KeyEventResult.handled) {
      print('Handled shortcut $event in $context');
    }
    return result;
  }
}

class MyShortcuts extends StatelessWidget {
  final Widget child;
  const MyShortcuts({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      includeSemantics: true,
      shortcuts: {
        SingleActivator(LogicalKeyboardKey.escape): const EscapeIntent(),
        SingleActivator(LogicalKeyboardKey.keyF, control: true):
            const SearchIntent(),
      },
      child: FocusScope(
        autofocus: true,
        child: Actions(
          actions: {
            GoBackIntent: GoBackAction(),
          },
          child: child,
        ),
      ),
    );
  }
}
