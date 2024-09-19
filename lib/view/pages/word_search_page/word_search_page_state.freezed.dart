// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_search_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordSearchPageState _$WordSearchPageStateFromJson(Map<String, dynamic> json) {
  return _WordSearchPageState.fromJson(json);
}

/// @nodoc
mixin _$WordSearchPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get exSentence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordSearchPageStateCopyWith<WordSearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSearchPageStateCopyWith<$Res> {
  factory $WordSearchPageStateCopyWith(
          WordSearchPageState value, $Res Function(WordSearchPageState) then) =
      _$WordSearchPageStateCopyWithImpl<$Res, WordSearchPageState>;
  @useResult
  $Res call(
      {bool isLoading, String word, String explanation, String exSentence});
}

/// @nodoc
class _$WordSearchPageStateCopyWithImpl<$Res, $Val extends WordSearchPageState>
    implements $WordSearchPageStateCopyWith<$Res> {
  _$WordSearchPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? word = null,
    Object? explanation = null,
    Object? exSentence = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordSearchPageStateImplCopyWith<$Res>
    implements $WordSearchPageStateCopyWith<$Res> {
  factory _$$WordSearchPageStateImplCopyWith(_$WordSearchPageStateImpl value,
          $Res Function(_$WordSearchPageStateImpl) then) =
      __$$WordSearchPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, String word, String explanation, String exSentence});
}

/// @nodoc
class __$$WordSearchPageStateImplCopyWithImpl<$Res>
    extends _$WordSearchPageStateCopyWithImpl<$Res, _$WordSearchPageStateImpl>
    implements _$$WordSearchPageStateImplCopyWith<$Res> {
  __$$WordSearchPageStateImplCopyWithImpl(_$WordSearchPageStateImpl _value,
      $Res Function(_$WordSearchPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? word = null,
    Object? explanation = null,
    Object? exSentence = null,
  }) {
    return _then(_$WordSearchPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordSearchPageStateImpl implements _WordSearchPageState {
  const _$WordSearchPageStateImpl(
      {this.isLoading = false,
      this.word = '',
      this.explanation = '',
      this.exSentence = ''});

  factory _$WordSearchPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordSearchPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String word;
  @override
  @JsonKey()
  final String explanation;
  @override
  @JsonKey()
  final String exSentence;

  @override
  String toString() {
    return 'WordSearchPageState(isLoading: $isLoading, word: $word, explanation: $explanation, exSentence: $exSentence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSearchPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.exSentence, exSentence) ||
                other.exSentence == exSentence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, word, explanation, exSentence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSearchPageStateImplCopyWith<_$WordSearchPageStateImpl> get copyWith =>
      __$$WordSearchPageStateImplCopyWithImpl<_$WordSearchPageStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordSearchPageStateImplToJson(
      this,
    );
  }
}

abstract class _WordSearchPageState implements WordSearchPageState {
  const factory _WordSearchPageState(
      {final bool isLoading,
      final String word,
      final String explanation,
      final String exSentence}) = _$WordSearchPageStateImpl;

  factory _WordSearchPageState.fromJson(Map<String, dynamic> json) =
      _$WordSearchPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  String get word;
  @override
  String get explanation;
  @override
  String get exSentence;
  @override
  @JsonKey(ignore: true)
  _$$WordSearchPageStateImplCopyWith<_$WordSearchPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
