import 'package:freezed_annotation/freezed_annotation.dart';
import '../../business/db_v2_providers.dart';

part 'models.freezed.dart';

@freezed
abstract class CouncilViewModel with _$CouncilViewModel {
  const factory CouncilViewModel({
    required PhdStudent student,
    required TeacherData president,
    required TeacherData secretary,
    required TeacherData member1,
    required TeacherData member2,
    required TeacherData member3,
  }) = _CouncilViewModel;
}

@freezed
abstract class CouncilPaymentViewModel with _$CouncilPaymentViewModel {
  const CouncilPaymentViewModel._();
  const factory CouncilPaymentViewModel({
    required String reason,
    required List<CouncilViewModel> councils,
    required Map<CouncilRole, double> payPerRole,
  }) = _CouncilPaymentViewModel;
}
