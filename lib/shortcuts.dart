import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

final navigationKey = GlobalKey<NavigatorState>();
final searchAnchorKey = GlobalKey<State<SearchAnchor>>();
final globalFocusKey = GlobalKey<State<Focus>>();

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
