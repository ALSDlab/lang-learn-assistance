// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingPageState _$SettingPageStateFromJson(Map<String, dynamic> json) {
  return _SettingPageState.fromJson(json);
}

/// @nodoc
mixin _$SettingPageState {
  bool get tapped => throw _privateConstructorUsedError;
  String get selectedLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get selectedLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingPageStateCopyWith<SettingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingPageStateCopyWith<$Res> {
  factory $SettingPageStateCopyWith(
          SettingPageState value, $Res Function(SettingPageState) then) =
      _$SettingPageStateCopyWithImpl<$Res, SettingPageState>;
  @useResult
  $Res call(
      {bool tapped,
      String selectedLanguage,
      String targetLanguage,
      String selectedLevel});
}

/// @nodoc
class _$SettingPageStateCopyWithImpl<$Res, $Val extends SettingPageState>
    implements $SettingPageStateCopyWith<$Res> {
  _$SettingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tapped = null,
    Object? selectedLanguage = null,
    Object? targetLanguage = null,
    Object? selectedLevel = null,
  }) {
    return _then(_value.copyWith(
      tapped: null == tapped
          ? _value.tapped
          : tapped // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedLevel: null == selectedLevel
          ? _value.selectedLevel
          : selectedLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingPageStateImplCopyWith<$Res>
    implements $SettingPageStateCopyWith<$Res> {
  factory _$$SettingPageStateImplCopyWith(_$SettingPageStateImpl value,
          $Res Function(_$SettingPageStateImpl) then) =
      __$$SettingPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool tapped,
      String selectedLanguage,
      String targetLanguage,
      String selectedLevel});
}

/// @nodoc
class __$$SettingPageStateImplCopyWithImpl<$Res>
    extends _$SettingPageStateCopyWithImpl<$Res, _$SettingPageStateImpl>
    implements _$$SettingPageStateImplCopyWith<$Res> {
  __$$SettingPageStateImplCopyWithImpl(_$SettingPageStateImpl _value,
      $Res Function(_$SettingPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tapped = null,
    Object? selectedLanguage = null,
    Object? targetLanguage = null,
    Object? selectedLevel = null,
  }) {
    return _then(_$SettingPageStateImpl(
      tapped: null == tapped
          ? _value.tapped
          : tapped // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedLevel: null == selectedLevel
          ? _value.selectedLevel
          : selectedLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingPageStateImpl implements _SettingPageState {
  const _$SettingPageStateImpl(
      {this.tapped = false,
      this.selectedLanguage = '',
      this.targetLanguage = '',
      this.selectedLevel = ''});

  factory _$SettingPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool tapped;
  @override
  @JsonKey()
  final String selectedLanguage;
  @override
  @JsonKey()
  final String targetLanguage;
  @override
  @JsonKey()
  final String selectedLevel;

  @override
  String toString() {
    return 'SettingPageState(tapped: $tapped, selectedLanguage: $selectedLanguage, targetLanguage: $targetLanguage, selectedLevel: $selectedLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingPageStateImpl &&
            (identical(other.tapped, tapped) || other.tapped == tapped) &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.selectedLevel, selectedLevel) ||
                other.selectedLevel == selectedLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, tapped, selectedLanguage, targetLanguage, selectedLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingPageStateImplCopyWith<_$SettingPageStateImpl> get copyWith =>
      __$$SettingPageStateImplCopyWithImpl<_$SettingPageStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingPageStateImplToJson(
      this,
    );
  }
}

abstract class _SettingPageState implements SettingPageState {
  const factory _SettingPageState(
      {final bool tapped,
      final String selectedLanguage,
      final String targetLanguage,
      final String selectedLevel}) = _$SettingPageStateImpl;

  factory _SettingPageState.fromJson(Map<String, dynamic> json) =
      _$SettingPageStateImpl.fromJson;

  @override
  bool get tapped;
  @override
  String get selectedLanguage;
  @override
  String get targetLanguage;
  @override
  String get selectedLevel;
  @override
  @JsonKey(ignore: true)
  _$$SettingPageStateImplCopyWith<_$SettingPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
