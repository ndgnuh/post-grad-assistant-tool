import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/business/selection_models.dart';
import 'package:riverpod/riverpod.dart';

import '../../custom_widgets.dart';

/// Filter start create date
final startDateProvider = NotifierProvider(
  NullableStateNotifier.new,
);

/// Filter end create date
final endDateProvider = NotifierProvider(
  NullableStateNotifier.new,
);

final phdCohortSelectionProvider = AsyncNotifierProvider(
  () => PhdCohortSelectionModelNotifier('admission-payment'),
);

final phdStudentIdsByCohortProvider = AsyncNotifierProvider.family(
  (String cohort) => PhdStudentIdsNotifier(cohort: cohort),
);

final phdIdsProvider = FutureProvider<List<int>>(
  (ref) async {
    final model = await ref.watch(phdCohortSelectionProvider.future);
    final cohort = model.selected;

    if (cohort == null) {
      return <int>[];
    }

    final ids = await ref.watch(phdStudentIdsByCohortProvider(cohort).future);
    return ids;
  },
);
