import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final navigationKey = GlobalKey<NavigatorState>();
final searchAnchorKey = GlobalKey<State<SearchAnchor>>();
final scaffoldKey = GlobalKey<ScaffoldState>();
final globalFocusKey = GlobalKey<State<Focus>>();
final searchFieldKey = GlobalKey<State<TextField>>();
final shortcutStateKey = GlobalKey<State<CommonShortcuts>>();

final focusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
  final focusNode = FocusNode();
  ref.onDispose(() => focusNode.dispose());
  return focusNode;
});

final tabControllerNotifier = ValueNotifier<TabController?>(null);

extension TabControllerExt on BuildContext {
  TabController? get tabController => tabControllerNotifier.value;
}

class TrackedTabController extends StatelessWidget {
  final int length;
  final int initialIndex;
  final Widget child;
  final Duration? animationDuration;

  const TrackedTabController({
    super.key,
    required this.length,
    this.initialIndex = 0,
    required this.child,
    this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      initialIndex: initialIndex,
      animationDuration: animationDuration,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);
          tabControllerNotifier.value = controller;
          return child;
        },
      ),
    );
  }
}

class NextTabIntent extends Intent {
  const NextTabIntent();
}

class PreviousTabIntent extends Intent {
  const PreviousTabIntent();
}

class ChangeTabAction extends Action<NextTabIntent> {
  final BuildContext context;
  final int offset;

  ChangeTabAction({
    required this.context,
    required this.offset,
  });

  @override
  Object? invoke(NextTabIntent intent) {
    print("Invoking [ChangeTabAction] with offset $offset");
    final tabController = context.tabController;
    switch (tabController) {
      case null:
        print("No TabController found in context");
        return null;
      case TabController controller:
        int newIndex = controller.index + offset;
        print(("Current tab index: ${controller.index}, new index: $newIndex"));
        if (newIndex < 0) {
          newIndex = controller.length - 1;
        } else if (newIndex >= controller.length) {
          newIndex = 0;
        }
        controller.animateTo(newIndex);
        return null;
    }
  }
}

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
  final BuildContext context;
  GoBackAction({required this.context});

  @override
  Object? invoke(GoBackIntent intent) {
    print("Invoking GoBackAction");
    final navigator = Navigator.maybeOf(context);
    if (navigator == null) {
      print("No navigator found in context");
      return null;
    }

    if (navigator.canPop()) {
      navigator.pop();
    } else {
      print("No route to pop");
    }
    return null;
  }
}

class SearchAction extends Action<SearchIntent> {
  final BuildContext context;
  final WidgetRef ref;

  SearchAction({required this.context, required this.ref});

  @override
  Object? invoke(SearchIntent intent) {
    print("Invoking SearchAction");
    final focusNode = ref.read(focusNodeProvider);
    focusNode.requestFocus();
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
            GoBackIntent: GoBackAction(context: context),
          },
          child: child,
        ),
      ),
    );
  }
}
