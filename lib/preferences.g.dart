// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MyDivision)
const myDivisionProvider = MyDivisionProvider._();

final class MyDivisionProvider
    extends $AsyncNotifierProvider<MyDivision, String> {
  const MyDivisionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myDivisionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myDivisionHash();

  @$internal
  @override
  MyDivision create() => MyDivision();
}

String _$myDivisionHash() => r'c9cf02a5a19b0caab5083809839c45e85fcfd0ef';

abstract class _$MyDivision extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MyName)
const myNameProvider = MyNameProvider._();

final class MyNameProvider extends $AsyncNotifierProvider<MyName, String?> {
  const MyNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myNameHash();

  @$internal
  @override
  MyName create() => MyName();
}

String _$myNameHash() => r'85d46cb71519f0ebf7b098979af152eeb8bb0e00';

abstract class _$MyName extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
