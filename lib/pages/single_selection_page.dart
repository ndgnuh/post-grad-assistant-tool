import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A page to select items from a list with search functionality
/// and optional initial selection. If [includeNull] is true,
/// a null item will be included in the list of suggestions when
/// the search results are displayed.
///
/// The [searchFunction] is called with the search query to fetch
/// the list of items to display.
///
/// The [itemBuilder] is used to build the widget for each item in the list.
/// The [initialSelection] is the item that will be selected by default.
/// To retrieve the selected item, use [Navigator.pop(context, selectedItem)]
/// as a callback in the [itemBuilder] when the user selects an item.
class PageSelectThings<T> extends StatelessWidget {
  static const String routeName = "/etc/select-things";

  final String title;
  final Duration debounceDuration;
  final T? initialSelection;
  final bool includeNull;
  final String hintText;
  final FutureOr<List<T>> Function(String query) searchFunction;
  final Widget Function(BuildContext context, T? item) itemBuilder;
  final bool searchWhileTyping;
  final bool searchWithEmptyQuery;

  const PageSelectThings({
    super.key,
    required this.includeNull,
    required this.title,
    required this.searchFunction,
    required this.itemBuilder,
    this.debounceDuration = const Duration(milliseconds: 400),
    this.initialSelection,
    this.hintText = "Tìm kiếm",
    this.searchWhileTyping = true,
    this.searchWithEmptyQuery = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_State>(
      create: (context) => _State(
        searchController: TextEditingController(),
        searchWhileTyping: searchWhileTyping,
        searchWithEmptyQuery: searchWithEmptyQuery,
        debounceDuration: debounceDuration,
        includeNull: includeNull,
        initialSelection: initialSelection,
        searchFunction: searchFunction,
      ),
      builder: (context, child) {
        final state = _State.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: state.searchController,
                  onChanged: (value) {
                    if (state.searchWhileTyping) {
                      state.debounceSearch();
                    }
                  },
                  onEditingComplete: () => state.searchNow(),
                  onSubmitted: (value) => state.searchNow(),
                  decoration: InputDecoration(
                    labelText: hintText,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: Selector(
                    selector: (_, _State state) => state.suggestions,
                    builder: (_, suggestions, __) => ListView.builder(
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        final item = suggestions[index];
                        return itemBuilder(context, item);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _State<T> extends ChangeNotifier {
  final TextEditingController searchController;
  final bool searchWhileTyping;
  final bool searchWithEmptyQuery;
  final bool includeNull;
  final Duration debounceDuration;
  final T? initialSelection;
  final FutureOr<List<T>> Function(String query) searchFunction;

  Timer? _debounceTimer;
  List<T> _searchResults = [];

  _State({
    required this.searchFunction,
    required this.searchController,
    required this.searchWhileTyping,
    required this.searchWithEmptyQuery,
    required this.debounceDuration,
    required this.includeNull,
    this.initialSelection,
  });

  List<T?> get suggestions {
    return [
      initialSelection,
      if (includeNull) null,
      ..._searchResults.where((item) => item != initialSelection),
    ];
  }

  Future<void> debounceSearch() async {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounceDuration, () {
      searchNow();
    });
  }

  Future<void> searchNow() async {
    final query = searchController.text.trim();
    if (query.isEmpty && !searchWithEmptyQuery) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    try {
      final results = await searchFunction(query);
      _searchResults = results;
    } catch (e) {
      _searchResults = [];
      print("Error during search: $e");
    }
    notifyListeners();
  }

  static _State of(BuildContext context) {
    return Provider.of<_State>(context, listen: false);
  }
}
