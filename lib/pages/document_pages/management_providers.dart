import 'package:fami_tools/custom_widgets.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';

final searchTextProvider = NotifierProvider(TextNotifier.new);

final documentsProvider = FutureProvider<List<DocumentData>?>(
  (Ref ref) async {
    final searchQuery = ref.watch(searchTextProvider);

    // User has to enter something to search
    if (searchQuery.trim().isEmpty) {
      return null;
    }

    // Get the database instance
    final db = await ref.watch(mainDatabaseProvider.future);

    // Perform the search query
    final stmt = db.searchDocuments(searchText: searchQuery);
    final results = await stmt.get();
    return results;
  },
);
