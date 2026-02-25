import 'dart:async';

import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import '../../business/selection_models.dart';

final acceptanceEmailProvider = AsyncNotifierProvider(
  AcceptanceEmailNotifier.new,
);

final ruleBriefingEmailProvider = FutureProvider((ref) async {
  final location = await ref.watch(interviewLocationProvider.future);
  final datetime = await ref.watch(interviewDateTimeProvider.future);
  final time = DateFormat("HH:mm").format(datetime!);
  final date = DateFormat("dd/MM/yyyy").format(datetime);
  final integratedIds = await ref.watch(integratedAdmissionIdsProvider.future);
  final myName = await ref.watch(myNameProvider.future);

  final subject = "Phổ biến quy chế chương trình Thạc sĩ Toán - Tin";

  final recipients = <String>{};
  for (final id in integratedIds) {
    final student = await ref.watch(studentByIdProvider(id).future);
    recipients.add(student.personalEmail!);
  }

  final body =
      """Chào các bạn ứng viên,

Mình là $myName, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.

Chúc mừng hồ sơ của các bạn đã đạt điều kiện của chương trình Thạc sĩ Toán Tin. Vì các bạn thuộc diện Tích hợp - Cử nhân Thạc sĩ nên được bỏ qua bước phỏng vấn.
Mời các bạn đến tham gia nghe phổ biến quy chế và hỏi đáp về chương trình.

- Thời gian: $time, ngày $date
- Địa điểm: $location, Đại học Bách khoa Hà Nội

Các bạn xác nhận tham gia bằng cách trả lời email này với tiêu đề "Xác nhận tham gia - [Họ và tên]" giúp mình nhé.

Cảm ơn các bạn.
""";

  return Email(
    subject: subject,
    recipients: recipients,
    body: body,
  );
});

// View models
// ===========

final admissionCouncilSelectionProvider = AsyncNotifierProvider(
  () => CouncilSelectionModelNotifier("admission"),
);

final admissionListViewModelProvider = AsyncNotifierProvider(
  AdmissionListViewModelNotifier.new,
);

final cohortSelectionProvider = AsyncNotifierProvider(
  () => CohortSelectionModelNotifier("admission"),
);

// Interview specific view models
// ==============================

final downloadDirectoryProvider = NotifierProvider(
  DownloadDirectoryNotifier.new,
);

final interviewDateTimeProvider = AsyncNotifierProvider(
  InterviewDateTimeNotifier.new,
);

// Emails
// ======

final interviewEmailProvider = AsyncNotifierProvider(
  InterviewEmailNotifier.new,
);

final interviewLocationProvider = AsyncNotifierProvider(
  InterviewLocationNotifier.new,
);

class AcceptanceEmailNotifier extends AsyncNotifier<Email?> {
  static const String subject =
      "Thông báo trúng tuyển chương trình Thạc sĩ Toán - Tin";

  @override
  FutureOr<Email?> build() async {
    // Get cohort group link
    final cohortModel = await ref.watch(cohortSelectionProvider.future);
    final cohort = cohortModel.selected;
    if (cohort == null) return null;
    final cohortGroupLink = cohort.groupUrl;

    // Get admission student emails
    final admissionIds = await ref.watch(admissionStudentIdsProvider.future);
    final recipients = <String>{};
    for (final id in admissionIds) {
      final student = await ref.watch(studentByIdProvider(id).future);
      recipients.add(student.personalEmail!);
    }

    final text =
        """Chào các bạn ứng viên,

Chúc mừng các bạn trúng tuyển chương trình Thạc sĩ Toán - Tin. Ban Đào tạo sẽ gửi email thông báo nhập học cho các bạn.

Sau khi thực hiện các thủ tục nhập học xong, các bạn phản hồi lại cho mình qua email những thông tin sau để phục vụ cho công tác quản lý:

- Họ tên đầy đủ,
- Mã học viên,
- Mã lớp quản lý/tên khóa,
- Email học viên (email với đuôi sis.hust.edu.vn).

Sau khi nhập học, các bạn tham gia nhóm Zalo học viên ở dưới để tiện cho việc nhận thông báo và phổ biến công việc. Các bạn nếu gặp vấn đề gì trong quá trình nhập học cũng có thể liên hệ với mình thông qua email này.
Link nhóm Zalo: $cohortGroupLink

Nếu không có dự định nhập học, vui lòng phản hồi lại email này với tiêu đề "Từ chối nhập học - [Họ và tên]" để mình tiện theo dõi nhé. Xin cảm ơn.
""";
    return Email(subject: subject, recipients: recipients, body: text);
  }
}

class AdmissionListViewModel {
  final Set<StudentData> admission;
  final Set<StudentData> delayed;

  AdmissionListViewModel({
    required this.admission,
    required this.delayed,
  });

  List<StudentData> get admissionList => admission.toList()..sort(sort);
  List<StudentData> get delayedList => delayed.toList()..sort(sort);

  static int sort(StudentData a, StudentData b) {
    final cmp1 = switch ((a.admissionType, b.admissionType)) {
      (AdmissionType at1, AdmissionType at2) => at1.sortPriority.compareTo(
        at2.sortPriority,
      ),
      _ => 0,
    };

    final cmp2 = switch ((a.admissionId, b.admissionId)) {
      (String id1, String id2) => id1.compareTo(id2),
      (_, _) => 0,
    };
    return cmp1 * 100 + cmp2;
  }
}

class AdmissionListViewModelNotifier
    extends AsyncNotifier<AdmissionListViewModel> {
  @override
  FutureOr<AdmissionListViewModel> build() async {
    final admissionIds = await ref.watch(admissionStudentIdsProvider.future);
    final delayIds = await ref.watch(delayedAdmissionStudentIdsProvider.future);

    final admission = <StudentData>{};
    for (final id in admissionIds) {
      final student = await ref.watch(studentByIdProvider(id).future);
      if (student != null) admission.add(student);
    }

    final delayed = <StudentData>{};
    for (final id in delayIds) {
      final student = await ref.watch(studentByIdProvider(id).future);
      if (student != null) delayed.add(student);
    }

    return AdmissionListViewModel(
      admission: admission,
      delayed: delayed,
    );
  }
}

class DownloadDirectoryNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  Future<void> set(String path) async {
    state = path;
  }
}

class InterviewDateTimeNotifier extends AsyncNotifier<DateTime?> {
  static const key = 'admission/interview_datetime';

  @override
  Future<DateTime?> build() async {
    final pref = await SharedPreferences.getInstance();
    final dateStr = pref.getString(key);
    if (dateStr != null) {
      try {
        final date = DateTime.parse(dateStr);
        return date;
      } catch (e) {
        // Invalid date format
        await pref.remove(key);
      }
    }
    return Future.value(null);
  }

  void set(DateTime? date) async {
    final pref = await SharedPreferences.getInstance();
    if (date == null) {
      await pref.remove(key);
    } else {
      await pref.setString(key, date.toIso8601String());
    }
    state = AsyncData(date);
  }
}

class InterviewEmailNotifier extends AsyncNotifier<Email> {
  static const String subject =
      "Phỏng vấn xét tuyển chương trình Thạc sĩ Toán - Tin";

  @override
  Future<Email> build() async {
    final location = await ref.watch(interviewLocationProvider.future);
    final datetime = await ref.watch(interviewDateTimeProvider.future);
    final interviewIds = await ref.watch(interviewAdmissionIdsProvider.future);

    final recipients = <String>{};
    for (final id in interviewIds) {
      final student = await ref.watch(studentByIdProvider(id).future);
      if (student != null) {
        recipients.add(student.personalEmail!);
      }
    }

    final myName = await ref.watch(myNameProvider.future);

    return Email(
      subject: subject,
      recipients: recipients,
      body: emailBody(
        myName: myName,
        location: location,
        datetime: datetime ?? DateTime.now(),
      ),
    );
  }

  static String emailBody({
    required String location,
    required DateTime datetime,
    required String myName,
  }) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');
    final timeStr = timeFormat.format(datetime);
    final dateStr = dateFormat.format(datetime);
    return """Chào các bạn ứng viên,

Mình là $myName, trợ lý đào tạo sau đại học của Khoa Toán - Tin, Đại học Bách khoa Hà Nội.

Chúc mừng hồ sơ của bạn đã đạt điều kiện của chương trình Thạc sĩ Toán Tin. Bước tiếp theo để nhập học là phỏng vấn xét tuyển.
Mời bạn đến phỏng vấn xét tuyển vào:

- Thời gian: $timeStr ngày $dateStr
- Địa điểm: $location, Đại học Bách khoa Hà Nội

Các bạn xác nhận tham gia phỏng vấn bằng cách trả lời email này với tiêu đề "Xác nhận tham gia phỏng vấn - [Họ và tên]" giúp mình nhé.
Cảm ơn các bạn.""";
  }
}

class InterviewLocationNotifier extends AsyncNotifier<String> {
  static const key = 'admission/interview_location';

  @override
  Future<String> build() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? "";
  }

  Future<void> set(String location) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key, location);
    state = AsyncData(location);
  }
}
