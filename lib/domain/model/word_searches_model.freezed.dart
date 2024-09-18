// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_searches_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordSearchesModel _$WordSearchesModelFromJson(Map<String, dynamic> json) {
  return _WordSearchesModel.fromJson(json);
}

/// @nodoc
mixin _$WordSearchesModel {
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation')
  String get explanation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordSearchesModelCopyWith<WordSearchesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSearchesModelCopyWith<$Res> {
  factory $WordSearchesModelCopyWith(
          WordSearchesModel value, $Res Function(WordSearchesModel) then) =
      _$WordSearchesModelCopyWithImpl<$Res, WordSearchesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String word,
      @JsonKey(name: 'explanation') String explanation});
}

/// @nodoc
class _$WordSearchesModelCopyWithImpl<$Res, $Val extends WordSearchesModel>
    implements $WordSearchesModelCopyWith<$Res> {
  _$WordSearchesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordSearchesModelImplCopyWith<$Res>
    implements $WordSearchesModelCopyWith<$Res> {
  factory _$$WordSearchesModelImplCopyWith(_$WordSearchesModelImpl value,
          $Res Function(_$WordSearchesModelImpl) then) =
      __$$WordSearchesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String word,
      @JsonKey(name: 'explanation') String explanation});
}

/// @nodoc
class __$$WordSearchesModelImplCopyWithImpl<$Res>
    extends _$WordSearchesModelCopyWithImpl<$Res, _$WordSearchesModelImpl>
    implements _$$WordSearchesModelImplCopyWith<$Res> {
  __$$WordSearchesModelImplCopyWithImpl(_$WordSearchesModelImpl _value,
      $Res Function(_$WordSearchesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? explanation = null,
  }) {
    return _then(_$WordSearchesModelImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordSearchesModelImpl implements _WordSearchesModel {
  const _$WordSearchesModelImpl(
      {@JsonKey(name: 'word') required this.word,
      @JsonKey(name: 'explanation') required this.explanation});

  factory _$WordSearchesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordSearchesModelImplFromJson(json);

  @override
  @JsonKey(name: 'word')
  final String word;
  @override
  @JsonKey(name: 'explanation')
  final String explanation;

  @override
  String toString() {
    return 'WordSearchesModel(word: $word, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSearchesModelImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSearchesModelImplCopyWith<_$WordSearchesModelImpl> get copyWith =>
      __$$WordSearchesModelImplCopyWithImpl<_$WordSearchesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordSearchesModelImplToJson(
      this,
    );
  }
}

abstract class _WordSearchesModel implements WordSearchesModel {
  const factory _WordSearchesModel(
          {@JsonKey(name: 'word') required final String word,
          @JsonKey(name: 'explanation') required final String explanation}) =
      _$WordSearchesModelImpl;

  factory _WordSearchesModel.fromJson(Map<String, dynamic> json) =
      _$WordSearchesModelImpl.fromJson;

  @override
  @JsonKey(name: 'word')
  String get word;
  @override
  @JsonKey(name: 'explanation')
  String get explanation;
  @override
  @JsonKey(ignore: true)
  _$$WordSearchesModelImplCopyWith<_$WordSearchesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
