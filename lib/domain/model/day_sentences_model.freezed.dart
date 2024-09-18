// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_sentences_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DaySentencesModel _$DaySentencesModelFromJson(Map<String, dynamic> json) {
  return _DaySentencesModel.fromJson(json);
}

/// @nodoc
mixin _$DaySentencesModel {
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentence')
  String get sentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'like')
  bool get like => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation')
  String get explanation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DaySentencesModelCopyWith<DaySentencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaySentencesModelCopyWith<$Res> {
  factory $DaySentencesModelCopyWith(
          DaySentencesModel value, $Res Function(DaySentencesModel) then) =
      _$DaySentencesModelCopyWithImpl<$Res, DaySentencesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String date,
      @JsonKey(name: 'sentence') String sentence,
      @JsonKey(name: 'like') bool like,
      @JsonKey(name: 'explanation') String explanation});
}

/// @nodoc
class _$DaySentencesModelCopyWithImpl<$Res, $Val extends DaySentencesModel>
    implements $DaySentencesModelCopyWith<$Res> {
  _$DaySentencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sentence = null,
    Object? like = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DaySentencesModelImplCopyWith<$Res>
    implements $DaySentencesModelCopyWith<$Res> {
  factory _$$DaySentencesModelImplCopyWith(_$DaySentencesModelImpl value,
          $Res Function(_$DaySentencesModelImpl) then) =
      __$$DaySentencesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String date,
      @JsonKey(name: 'sentence') String sentence,
      @JsonKey(name: 'like') bool like,
      @JsonKey(name: 'explanation') String explanation});
}

/// @nodoc
class __$$DaySentencesModelImplCopyWithImpl<$Res>
    extends _$DaySentencesModelCopyWithImpl<$Res, _$DaySentencesModelImpl>
    implements _$$DaySentencesModelImplCopyWith<$Res> {
  __$$DaySentencesModelImplCopyWithImpl(_$DaySentencesModelImpl _value,
      $Res Function(_$DaySentencesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sentence = null,
    Object? like = null,
    Object? explanation = null,
  }) {
    return _then(_$DaySentencesModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DaySentencesModelImpl implements _DaySentencesModel {
  const _$DaySentencesModelImpl(
      {@JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'sentence') required this.sentence,
      @JsonKey(name: 'like') required this.like,
      @JsonKey(name: 'explanation') required this.explanation});

  factory _$DaySentencesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DaySentencesModelImplFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'sentence')
  final String sentence;
  @override
  @JsonKey(name: 'like')
  final bool like;
  @override
  @JsonKey(name: 'explanation')
  final String explanation;

  @override
  String toString() {
    return 'DaySentencesModel(date: $date, sentence: $sentence, like: $like, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaySentencesModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, sentence, like, explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DaySentencesModelImplCopyWith<_$DaySentencesModelImpl> get copyWith =>
      __$$DaySentencesModelImplCopyWithImpl<_$DaySentencesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DaySentencesModelImplToJson(
      this,
    );
  }
}

abstract class _DaySentencesModel implements DaySentencesModel {
  const factory _DaySentencesModel(
          {@JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'sentence') required final String sentence,
          @JsonKey(name: 'like') required final bool like,
          @JsonKey(name: 'explanation') required final String explanation}) =
      _$DaySentencesModelImpl;

  factory _DaySentencesModel.fromJson(Map<String, dynamic> json) =
      _$DaySentencesModelImpl.fromJson;

  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'sentence')
  String get sentence;
  @override
  @JsonKey(name: 'like')
  bool get like;
  @override
  @JsonKey(name: 'explanation')
  String get explanation;
  @override
  @JsonKey(ignore: true)
  _$$DaySentencesModelImplCopyWith<_$DaySentencesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
