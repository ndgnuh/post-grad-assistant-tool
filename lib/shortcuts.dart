import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationKey = GlobalKey<NavigatorState>();
final searchAnchorKey = GlobalKey<State<SearchAnchor>>();
final scaffoldKey = GlobalKey<ScaffoldState>();
final globalFocusKey = GlobalKey<State<Focus>>();
final searchFieldKey = GlobalKey<State<TextField>>();

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

class SaveIntent extends Intent {
  const SaveIntent();
}

class EditIntent extends Intent {
  const EditIntent();
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
    final controller = DefaultTabController.of(context);
    int newIndex = controller.index + offset;
    if (newIndex < 0) {
      newIndex = controller.length - 1;
    } else if (newIndex >= controller.length) {
      newIndex = 0;
    }
    controller.animateTo(newIndex);
    return null;
  }
}

class UnfocusAction extends Action<EscapeIntent> {
  final BuildContext context;
  UnfocusAction({required this.context});

  @override
  Object? invoke(EscapeIntent intent) {
    final focusScope = FocusScope.of(context);
    for (final node in focusScope.traversalDescendants) {
      if (node.hasPrimaryFocus) {
        node.unfocus();
        return null;
      }
    }
    return null;
  }
}

class _CbAction extends Action<Intent> {
  final BuildContext context;
  final Function(BuildContext) onInvokeCallback;

  _CbAction({required this.onInvokeCallback, required this.context});

  @override
  Object? invoke(Intent intent) {
    onInvokeCallback(context);
    return null;
  }
}

void noop(BuildContext _) {}

class FocusNodeProvider extends InheritedWidget {
  final FocusNode focusNode = FocusNode();

  FocusNodeProvider({
    super.key,
    required super.child,
  });

  static FocusNode of(BuildContext context) {
    final node = maybeOf(context);
    assert(
      node != null,
      'FocusNodeProvider.of() called with a context that does not contain a FocusNodeProvider.',
    );
    return node!;
  }

  static FocusNode? maybeOf(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<FocusNodeProvider>();
    return provider?.focusNode;
  }

  @override
  bool updateShouldNotify(FocusNodeProvider oldWidget) {
    return focusNode != oldWidget.focusNode;
  }
}

class CommonShortcuts extends StatelessWidget {
  final Widget child;
  final bool? enableTabSwitching;

  /// Allow passing navigator from previous context
  final NavigatorState? navigator;

  // The function should depends on the context so we can
  // pass states from inherited widgets if needed.
  final void Function(BuildContext)? onCreateNew;
  final void Function(BuildContext)? onSearch;
  final void Function(BuildContext)? onEdit;
  final void Function(BuildContext)? onSave;
  final void Function(BuildContext)? onPaste;
  final void Function(BuildContext)? onImport;

  const CommonShortcuts({
    super.key,
    required this.child,
    this.navigator,
    this.onEdit,
    this.onSave,
    this.onCreateNew,
    this.onSearch,
    this.onPaste,
    this.onImport,
    this.enableTabSwitching,
  });

  @override
  Widget build(BuildContext context) {
    final enableTs =
        enableTabSwitching ?? DefaultTabController.maybeOf(context) != null;

    return Shortcuts(
      shortcuts: {
        SingleActivator(LogicalKeyboardKey.escape): const EscapeIntent(),
        SingleActivator(LogicalKeyboardKey.arrowLeft, alt: true):
            const GoBackIntent(),
        SingleActivator(LogicalKeyboardKey.keyF, control: true):
            const SearchIntent(),
        // Do not override the default copy shortcut for no reason
        // SingleActivator(LogicalKeyboardKey.keyC, control: true):
        //     const CopyIntent(),
        SingleActivator(LogicalKeyboardKey.keyN, control: true):
            const CreateNewIntent(),
        SingleActivator(LogicalKeyboardKey.keyE, control: true):
            const EditIntent(),
        SingleActivator(LogicalKeyboardKey.keyS, control: true):
            const SaveIntent(),
        if (enableTs)
          SingleActivator(LogicalKeyboardKey.tab, control: true):
              const NextTabIntent(),
      },
      child: Actions(
        actions: {
          EscapeIntent: UnfocusAction(context: context),
          GoBackIntent: GoBackAction(context: context, navigator: navigator),
          CreateNewIntent: _CbAction(
            context: context,
            onInvokeCallback: onCreateNew ?? noop,
          ),
          SearchIntent: _CbAction(
            context: context,
            onInvokeCallback: onSearch ?? noop,
          ),
          CopyIntent: _CbAction(
            context: context,
            onInvokeCallback: onPaste ?? noop,
          ),
          EditIntent: _CbAction(
            context: context,
            onInvokeCallback: onEdit ?? noop,
          ),
          SaveIntent: _CbAction(
            context: context,
            onInvokeCallback: onSave ?? noop,
          ),
          NextTabIntent: ChangeTabAction(context: context, offset: 1),
        },
        child: FocusScope(
          autofocus: true,
          child: child,
        ),
      ),
    );
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
  final NavigatorState? navigator;
  GoBackAction({required this.context, this.navigator});

  @override
  Object? invoke(GoBackIntent intent) {
    print("Invoking GoBackAction");
    final navigator = this.navigator ?? Navigator.maybeOf(context);
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
