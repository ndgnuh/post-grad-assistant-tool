import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../business/selection_models.dart';
import '../../custom_widgets.dart';

/// Search text input by the user
final searchTextProvider = NotifierProvider(
  SearchTextNotifier.new,
);

/// Selected course category for filtering
final courseCategorySelectionProvider = NotifierProvider(
  CourseCategorySelectionModelNotifier.new,
);

/// Should we prompt the user to enter search criteria?
final shouldPromptInputProvider = Provider((ref) {
  final searchTerm = ref.watch(searchTextProvider);
  final categorySelection = ref.watch(courseCategorySelectionProvider);
  final category = categorySelection.selected;

  return searchTerm.isEmpty && category == null;
});

final courseIdsProvider = FutureProvider<List<String>>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);

  final categorySelection = ref.watch(courseCategorySelectionProvider);
  final searchText = ref.watch(searchTextProvider);
  final category = categorySelection.selected;

  if (searchText.isEmpty && category == null) {
    final allIds = await db.managers.course.map((c) => c.id).get();
    return allIds;
  }

  final ids = await db.searchCourses(
    searchText: searchText,
    category: category,
  );
  return ids;
});

class SearchTextNotifier extends Notifier<String> {
  @override
  String build() => '';

  void Function(String value) get setDebounce {
    return (String value) => debouncedCallback(
      function: () => set(value),
      duration: Duration(milliseconds: 200),
    );
  }

  void set(String newText) {
    state = newText;
  }
}

class CourseCategorySelectionModelNotifier
    extends Notifier<SelectionModel<CourseCategory>> {
  @override
  SelectionModel<CourseCategory> build() => SelectionModel<CourseCategory>(
    selected: null,
    options: CourseCategory.values,
  );

  void select(CourseCategory category) => state = state.select(category);

  void clear() => state = state.select(null);
}
