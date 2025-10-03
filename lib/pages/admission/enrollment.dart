import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import './_widgets.dart';
import './_providers.dart';
import '../../custom_widgets.dart';
import '../../business/domain_objects.dart';

final _selectedCohortProvider = AsyncNotifierProvider(
  _SelectedCohortNotifier.new,
);

class _SelectedCohortNotifier extends AsyncNotifier<Cohort?> {
  static const String prefKey = 'adminssion/selected_cohort_id';
  @override
  FutureOr<Cohort?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final cohortId = prefs.getString(prefKey);
    if (cohortId == null) {
      return null;
    }
    final cohort = await Cohort.getById(cohortId);
    return cohort;
  }

  Future<void> setCohort(Cohort? cohort) async {
    final prefs = await SharedPreferences.getInstance();

    if (cohort == null) {
      await prefs.remove(prefKey);
    } else {
      await prefs.setString(prefKey, cohort.id);
    }
    state = AsyncValue.data(cohort);
  }
}

class _CohortSelector extends ConsumerWidget {
  const _CohortSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cohortsState = ref.watch(cohortsProvider);
    switch (cohortsState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final cohorts = cohortsState.value!;

    return DropdownMenu<Cohort>(
      label: const Text("Khóa"),
      dropdownMenuEntries: [
        for (final cohort in cohorts)
          DropdownMenuEntry(
            value: cohort,
            label: cohort.id,
          ),
      ],
      onSelected: (cohort) {
        // set selected cohort
        ref.read(_selectedCohortProvider.notifier).setCohort(cohort);
      },
    );
  }
}

class AdmissionEnrollmentPage extends StatelessWidget {
  static const routeName = '/admission/enrollment';
  const AdmissionEnrollmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admission Enrollment'),
      ),
      body: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(context.gutter),
              child: EzRow(
                children: [
                  CouncilSelector(width: 600),
                  _CohortSelector(),
                  FilledButton.icon(
                    icon: const Icon(Icons.school),
                    onPressed: null,
                    label: Text("Nhập học"),
                  ),
                ],
              ),
            ),
          ),
          Flexible(child: const _EnrollmentForm()),
        ],
      ),
    );
  }
}

class _EnrollmentForm extends ConsumerWidget {
  const _EnrollmentForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsState = ref.watch(admissionStudentsProvider);
    switch (studentsState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final students = studentsState.value!;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.gutter),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.gutter,
          children: [
            for (final student in students)
              Flex(
                direction: Axis.horizontal,
                spacing: context.gutter,
                children: [
                  Flexible(fit: FlexFit.tight, child: Text(student.hoTen)),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Mã số sinh viên",
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Email học viên",
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
