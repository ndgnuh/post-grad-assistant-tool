import 'package:flutter/material.dart';

typedef WidgetBuilderFromValue<T> = Widget Function(T value);

class MultipleSelectionPageArgs<T> {
  final List<T> options;
  final WidgetBuilderFromValue<T> titleBuilder;
  final WidgetBuilderFromValue<T> subtitleBuilder;
  final ValueChanged<List<T>>? onSelected;
  final String title;

  MultipleSelectionPageArgs({
    required this.options,
    required this.titleBuilder,
    required this.subtitleBuilder,
    this.onSelected,
    this.title = 'Lựa chọn',
  });
}

class MultipleSelectionPage<T> extends StatefulWidget {
  static const String routeName = '/multiple-selection';

  final List<T> options;
  final WidgetBuilderFromValue<T> titleBuilder;
  final WidgetBuilderFromValue<T> subtitleBuilder;
  final ValueChanged<List<T>>? onSelected;
  final String title;

  const MultipleSelectionPage({
    super.key,
    required this.options,
    required this.titleBuilder,
    required this.subtitleBuilder,
    this.onSelected,
    this.title = 'Lựa chọn',
  });

  @override
  State<MultipleSelectionPage<T>> createState() => _State<T>();
}

class _State<T> extends State<MultipleSelectionPage<T>> {
  late List<ValueNotifier<bool>> selectedFlags;

  @override
  initState() {
    super.initState();
    selectedFlags = List<ValueNotifier<bool>>.generate(
      widget.options.length,
      (index) => ValueNotifier<bool>(false),
    );
  }

  void selectAll() {
    final allSelected = selectedFlags.every((notifier) => notifier.value);
    for (final notifier in selectedFlags) {
      notifier.value = !allSelected;
    }
  }

  void selectInvert() {
    for (final notifier in selectedFlags) {
      notifier.value = !notifier.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<T> options = widget.options;
    final titleBuilder = widget.titleBuilder;
    final subtitleBuilder = widget.subtitleBuilder;
    final ValueChanged<List<T>>? onSelected = widget.onSelected;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
          icon: const Icon(Icons.select_all),
          onPressed: selectAll,
        ),
        IconButton(
          icon: const Icon(Icons.flip_to_back),
          onPressed: selectInvert,
        ),
      ]),
      body: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // List of options with checkboxes
          ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final T option = options[index];
              final ValueNotifier<bool> valueListenable = selectedFlags[index];
              return ValueListenableBuilder(
                valueListenable: valueListenable,
                builder: (context, value, child) {
                  return Card(
                    child: InkWell(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: value,
                        onChanged: (bool? newValue) =>
                            valueListenable.value = newValue ?? value,
                        title: titleBuilder(option),
                        subtitle: subtitleBuilder(option),
                      ),
                    ),
                  );
                },
              );
            },
          ),

          OutlinedButton(
            onPressed: () {
              final navigator = Navigator.of(context);
              final selectedOptions = <T>[];
              for (int i = 0; i < options.length; i++) {
                if (selectedFlags[i].value) {
                  selectedOptions.add(options[i]);
                }
              }
              onSelected?.call(selectedOptions);
              navigator.pop<List<T>>(selectedOptions);
            },
            child: const Text('Xác nhận lựa chọn'),
          ),
        ],
      ),
    );
  }
}
