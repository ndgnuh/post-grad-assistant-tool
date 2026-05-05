import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../business/db_v2_providers.dart';
import '../../../core/dialogs.dart';
import '../data/dao.dart';
import '../presentation/providers.dart';

Future<CourseClassDao> _getDao(BuildContext context) async {
  final ref = ProviderScope.containerOf(context);
  final dao = await ref.read(daoProvider.future);
  return dao;
}

void showAccessUrlUpdateDialog({
  required BuildContext context,
  required CourseClassData courseClass,
}) async {
  final dao = await _getDao(context);
  final value = await showTextEditingDialog(
    title: Text("Link truy cập"),
    initialValue: courseClass.accessUrl,
  );
  if (value == null) return;

  dao.updateAccessUrl(classId: courseClass.id, value: value);
}

void showClassRoomUpdateDialog({
  required BuildContext context,
  required CourseClassData courseClass,
}) async {
  final dao = await _getDao(context);
  final room = await showTextEditingDialog(
    title: Text("Phòng học"),
    initialValue: courseClass.classroom,
  );
  if (room == null) return;

  dao.updateClassroom(classId: courseClass.id, room: room);
}

void showDayUpdateDialog({
  required BuildContext context,
  required CourseClassData courseClass,
}) async {
  final dao = await _getDao(context);
  final (dow, selected) = await showSingleSelectionDialog(
    title: Text("Ngày"),
    initialValue: courseClass.dayOfWeek,
    options: DayOfWeek.values,
  );
  if (!selected) return;
  dao.updateDayOfWeek(classId: courseClass.id, value: dow);
}

void showClassStatusUpdateDialog({
  required BuildContext context,
  required CourseClassData courseClass,
}) async {
  final dao = await _getDao(context);
  final (value, selected) = await showSingleSelectionDialog(
    title: Text("Trạng thái lớp"),
    initialValue: courseClass.status,
    options: CourseClassStatus.values,
    showDelete: false,
    valueFormatter: (option) => option.label,
  );

  if (value == null) return;
  dao.updateClassStatus(classId: courseClass.id, value: value);
}

void showPeriodSelectionDialog({
  required BuildContext context,
  required CourseClassData courseClass,
}) async {
  final dao = await _getDao(context);
  final value = await showDialog(
    context: context,
    builder: (context) {
      final navigator = Navigator.of(context);
      final options = [
        for (final value in PeriodOfDay.values)
          DropdownMenuEntry(label: value.toString(), value: value),
      ];

      final startPeriod = ValueNotifier<PeriodOfDay?>(null);
      final finishPeriod = ValueNotifier<PeriodOfDay?>(null);

      final formKey = GlobalKey<FormState>();

      return SimpleDialog(
        contentPadding: EdgeInsetsGeometry.all(context.gutter),
        title: Text("Chọn tiết học"),
        children: [
          Form(
            key: formKey,
            child: Column(
              spacing: context.gutterSmall,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownMenuFormField(
                  label: Text("Tiết bắt đầu"),
                  dropdownMenuEntries: options,
                  onSelected: (value) => startPeriod.value = value,
                  validator: (period) =>
                      (period == null) ? "Chọn tiết bắt đầu!" : null,
                ),

                DropdownMenuFormField(
                  label: Text("Tiết kết thúc"),
                  dropdownMenuEntries: options,
                  onSelected: (value) => finishPeriod.value = value,
                  validator: (period) {
                    if (period == null) return "Chọn tiết kết thúc";
                    if (period.value < (startPeriod.value?.value ?? 0)) {
                      return "Tiết kết thúc không được ở trước tiết bắt đầu";
                    }
                    return null;
                  },
                ),

                Row(
                  spacing: context.gutterSmall,
                  children: [
                    FilledButton(
                      onPressed: () {
                        final ok = formKey.currentState!.validate();
                        if (!ok) return;

                        final ret = (startPeriod.value, finishPeriod.value);
                        navigator.pop(ret);
                      },
                      child: Text("Ok"),
                    ),
                    OutlinedButton(
                      onPressed: () => navigator.pop(),
                      child: Text("Hủy"),
                    ),
                    TextButton(
                      onPressed: () => navigator.pop((null, null)),
                      child: Text("Xóa"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );

  if (value == null) return;

  final (startPeriod, finishPeriod) = value;
  dao.updateClassPeriods(
    classId: courseClass.id,
    startPeriod: startPeriod,
    finishPeriod: finishPeriod,
  );
}
