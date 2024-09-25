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
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation')
  String get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'exSentence')
  Map<String, String> get exSentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted')
  bool get deleted => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'word') String word,
      @JsonKey(name: 'explanation') String explanation,
      @JsonKey(name: 'exSentence') Map<String, String> exSentence,
      @JsonKey(name: 'deleted') bool deleted});
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
    Object? id = null,
    Object? word = null,
    Object? explanation = null,
    Object? exSentence = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      exSentence: null == exSentence
          ? _value.exSentence
          : exSentence // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'word') String word,
      @JsonKey(name: 'explanation') String explanation,
      @JsonKey(name: 'exSentence') Map<String, String> exSentence,
      @JsonKey(name: 'deleted') bool deleted});
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
    Object? id = null,
    Object? word = null,
    Object? explanation = null,
    Object? exSentence = null,
    Object? deleted = null,
  }) {
    return _then(_$WordSearchesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      exSentence: null == exSentence
          ? _value._exSentence
          : exSentence // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordSearchesModelImpl implements _WordSearchesModel {
  const _$WordSearchesModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'word') required this.word,
      @JsonKey(name: 'explanation') required this.explanation,
      @JsonKey(name: 'exSentence')
      required final Map<String, String> exSentence,
      @JsonKey(name: 'deleted') required this.deleted})
      : _exSentence = exSentence;

  factory _$WordSearchesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordSearchesModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'word')
  final String word;
  @override
  @JsonKey(name: 'explanation')
  final String explanation;
  final Map<String, String> _exSentence;
  @override
  @JsonKey(name: 'exSentence')
  Map<String, String> get exSentence {
    if (_exSentence is EqualUnmodifiableMapView) return _exSentence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exSentence);
  }

  @override
  @JsonKey(name: 'deleted')
  final bool deleted;

  @override
  String toString() {
    return 'WordSearchesModel(id: $id, word: $word, explanation: $explanation, exSentence: $exSentence, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSearchesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            const DeepCollectionEquality()
                .equals(other._exSentence, _exSentence) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, explanation,
      const DeepCollectionEquality().hash(_exSentence), deleted);

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
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'word') required final String word,
          @JsonKey(name: 'explanation') required final String explanation,
          @JsonKey(name: 'exSentence')
          required final Map<String, String> exSentence,
          @JsonKey(name: 'deleted') required final bool deleted}) =
      _$WordSearchesModelImpl;

  factory _WordSearchesModel.fromJson(Map<String, dynamic> json) =
      _$WordSearchesModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'word')
  String get word;
  @override
  @JsonKey(name: 'explanation')
  String get explanation;
  @override
  @JsonKey(name: 'exSentence')
  Map<String, String> get exSentence;
  @override
  @JsonKey(name: 'deleted')
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$WordSearchesModelImplCopyWith<_$WordSearchesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
