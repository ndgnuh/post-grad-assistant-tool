// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TrackedThesisIds)
const trackedThesisIdsProvider = TrackedThesisIdsProvider._();

final class TrackedThesisIdsProvider
    extends $AsyncNotifierProvider<TrackedThesisIds, List<int>> {
  const TrackedThesisIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackedThesisIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackedThesisIdsHash();

  @$internal
  @override
  TrackedThesisIds create() => TrackedThesisIds();
}

String _$trackedThesisIdsHash() => r'4699f802e9a41fa0223c61bbb2317757cd53ddd9';

abstract class _$TrackedThesisIds extends $AsyncNotifier<List<int>> {
  FutureOr<List<int>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<int>>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<int>>, List<int>>,
              AsyncValue<List<int>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TrackedThesesViewModel)
const trackedThesesViewModelProvider = TrackedThesesViewModelProvider._();

final class TrackedThesesViewModelProvider
    extends
        $AsyncNotifierProvider<TrackedThesesViewModel, List<ThesisViewModel>> {
  const TrackedThesesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackedThesesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackedThesesViewModelHash();

  @$internal
  @override
  TrackedThesesViewModel create() => TrackedThesesViewModel();
}

String _$trackedThesesViewModelHash() =>
    r'700911e902a6096be34a0494e266baaa433cc8f5';

abstract class _$TrackedThesesViewModel
    extends $AsyncNotifier<List<ThesisViewModel>> {
  FutureOr<List<ThesisViewModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ThesisViewModel>>, List<ThesisViewModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ThesisViewModel>>,
                List<ThesisViewModel>
              >,
              AsyncValue<List<ThesisViewModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ThesisById)
const thesisByIdProvider = ThesisByIdFamily._();

final class ThesisByIdProvider
    extends $AsyncNotifierProvider<ThesisById, Thesis> {
  const ThesisByIdProvider._({
    required ThesisByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'thesisByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$thesisByIdHash();

  @override
  String toString() {
    return r'thesisByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ThesisById create() => ThesisById();

  @override
  bool operator ==(Object other) {
    return other is ThesisByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$thesisByIdHash() => r'35d2fea748e5fc4099f273ae5afd0deca9704f38';

final class ThesisByIdFamily extends $Family
    with
        $ClassFamilyOverride<
          ThesisById,
          AsyncValue<Thesis>,
          Thesis,
          FutureOr<Thesis>,
          int
        > {
  const ThesisByIdFamily._()
    : super(
        retry: null,
        name: r'thesisByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ThesisByIdProvider call(int id) =>
      ThesisByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'thesisByIdProvider';
}

abstract class _$ThesisById extends $AsyncNotifier<Thesis> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Thesis> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Thesis>, Thesis>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Thesis>, Thesis>,
              AsyncValue<Thesis>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ThesisViewModelById)
const thesisViewModelByIdProvider = ThesisViewModelByIdFamily._();

final class ThesisViewModelByIdProvider
    extends $AsyncNotifierProvider<ThesisViewModelById, ThesisViewModel> {
  const ThesisViewModelByIdProvider._({
    required ThesisViewModelByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'thesisViewModelByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$thesisViewModelByIdHash();

  @override
  String toString() {
    return r'thesisViewModelByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ThesisViewModelById create() => ThesisViewModelById();

  @override
  bool operator ==(Object other) {
    return other is ThesisViewModelByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$thesisViewModelByIdHash() =>
    r'e1e5c050b387086e7fc1108d6402d49d97aed456';

final class ThesisViewModelByIdFamily extends $Family
    with
        $ClassFamilyOverride<
          ThesisViewModelById,
          AsyncValue<ThesisViewModel>,
          ThesisViewModel,
          FutureOr<ThesisViewModel>,
          int
        > {
  const ThesisViewModelByIdFamily._()
    : super(
        retry: null,
        name: r'thesisViewModelByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ThesisViewModelByIdProvider call(int thesisId) =>
      ThesisViewModelByIdProvider._(argument: thesisId, from: this);

  @override
  String toString() => r'thesisViewModelByIdProvider';
}

abstract class _$ThesisViewModelById extends $AsyncNotifier<ThesisViewModel> {
  late final _$args = ref.$arg as int;
  int get thesisId => _$args;

  FutureOr<ThesisViewModel> build(int thesisId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<ThesisViewModel>, ThesisViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ThesisViewModel>, ThesisViewModel>,
              AsyncValue<ThesisViewModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(thesesByIds)
const thesesByIdsProvider = ThesesByIdsFamily._();

final class ThesesByIdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Thesis>>,
          List<Thesis>,
          FutureOr<List<Thesis>>
        >
    with $FutureModifier<List<Thesis>>, $FutureProvider<List<Thesis>> {
  const ThesesByIdsProvider._({
    required ThesesByIdsFamily super.from,
    required List<int> super.argument,
  }) : super(
         retry: null,
         name: r'thesesByIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$thesesByIdsHash();

  @override
  String toString() {
    return r'thesesByIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Thesis>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Thesis>> create(Ref ref) {
    final argument = this.argument as List<int>;
    return thesesByIds(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ThesesByIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$thesesByIdsHash() => r'6a15d095eb6d0a1e57f895c81ee145f3e0130279';

final class ThesesByIdsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Thesis>>, List<int>> {
  const ThesesByIdsFamily._()
    : super(
        retry: null,
        name: r'thesesByIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ThesesByIdsProvider call(List<int> ids) =>
      ThesesByIdsProvider._(argument: ids, from: this);

  @override
  String toString() => r'thesesByIdsProvider';
}

@ProviderFor(paymentViewModel)
const paymentViewModelProvider = PaymentViewModelProvider._();

final class PaymentViewModelProvider
    extends
        $FunctionalProvider<
          AsyncValue<ThesisPaymentPdfModel>,
          ThesisPaymentPdfModel,
          FutureOr<ThesisPaymentPdfModel>
        >
    with
        $FutureModifier<ThesisPaymentPdfModel>,
        $FutureProvider<ThesisPaymentPdfModel> {
  const PaymentViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentViewModelHash();

  @$internal
  @override
  $FutureProviderElement<ThesisPaymentPdfModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ThesisPaymentPdfModel> create(Ref ref) {
    return paymentViewModel(ref);
  }
}

String _$paymentViewModelHash() => r'cc6f956fe301574bfa14bfc4ee91b22054074f35';

@ProviderFor(ThesisCouncilMember)
const thesisCouncilMemberProvider = ThesisCouncilMemberFamily._();

final class ThesisCouncilMemberProvider
    extends $AsyncNotifierProvider<ThesisCouncilMember, TeacherData?> {
  const ThesisCouncilMemberProvider._({
    required ThesisCouncilMemberFamily super.from,
    required ({int thesisId, CouncilRole role}) super.argument,
  }) : super(
         retry: null,
         name: r'thesisCouncilMemberProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$thesisCouncilMemberHash();

  @override
  String toString() {
    return r'thesisCouncilMemberProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ThesisCouncilMember create() => ThesisCouncilMember();

  @override
  bool operator ==(Object other) {
    return other is ThesisCouncilMemberProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$thesisCouncilMemberHash() =>
    r'3f10af82244572b540cba35e34a87e43eaf22ee2';

final class ThesisCouncilMemberFamily extends $Family
    with
        $ClassFamilyOverride<
          ThesisCouncilMember,
          AsyncValue<TeacherData?>,
          TeacherData?,
          FutureOr<TeacherData?>,
          ({int thesisId, CouncilRole role})
        > {
  const ThesisCouncilMemberFamily._()
    : super(
        retry: null,
        name: r'thesisCouncilMemberProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ThesisCouncilMemberProvider call(({int thesisId, CouncilRole role}) args) =>
      ThesisCouncilMemberProvider._(argument: args, from: this);

  @override
  String toString() => r'thesisCouncilMemberProvider';
}

abstract class _$ThesisCouncilMember extends $AsyncNotifier<TeacherData?> {
  late final _$args = ref.$arg as ({int thesisId, CouncilRole role});
  ({int thesisId, CouncilRole role}) get args => _$args;

  FutureOr<TeacherData?> build(({int thesisId, CouncilRole role}) args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<TeacherData?>, TeacherData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TeacherData?>, TeacherData?>,
              AsyncValue<TeacherData?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
