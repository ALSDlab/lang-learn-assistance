// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizPageState _$QuizPageStateFromJson(Map<String, dynamic> json) {
  return _QuizPageState.fromJson(json);
}

/// @nodoc
mixin _$QuizPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<QuizModel> get quizList => throw _privateConstructorUsedError;
  List<int> get correctAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizPageStateCopyWith<QuizPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPageStateCopyWith<$Res> {
  factory $QuizPageStateCopyWith(
          QuizPageState value, $Res Function(QuizPageState) then) =
      _$QuizPageStateCopyWithImpl<$Res, QuizPageState>;
  @useResult
  $Res call(
      {bool isLoading, List<QuizModel> quizList, List<int> correctAnswer});
}

/// @nodoc
class _$QuizPageStateCopyWithImpl<$Res, $Val extends QuizPageState>
    implements $QuizPageStateCopyWith<$Res> {
  _$QuizPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? quizList = null,
    Object? correctAnswer = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizPageStateImplCopyWith<$Res>
    implements $QuizPageStateCopyWith<$Res> {
  factory _$$QuizPageStateImplCopyWith(
          _$QuizPageStateImpl value, $Res Function(_$QuizPageStateImpl) then) =
      __$$QuizPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, List<QuizModel> quizList, List<int> correctAnswer});
}

/// @nodoc
class __$$QuizPageStateImplCopyWithImpl<$Res>
    extends _$QuizPageStateCopyWithImpl<$Res, _$QuizPageStateImpl>
    implements _$$QuizPageStateImplCopyWith<$Res> {
  __$$QuizPageStateImplCopyWithImpl(
      _$QuizPageStateImpl _value, $Res Function(_$QuizPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? quizList = null,
    Object? correctAnswer = null,
  }) {
    return _then(_$QuizPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      correctAnswer: null == correctAnswer
          ? _value._correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizPageStateImpl implements _QuizPageState {
  const _$QuizPageStateImpl(
      {this.isLoading = false,
      final List<QuizModel> quizList = const [],
      final List<int> correctAnswer = const []})
      : _quizList = quizList,
        _correctAnswer = correctAnswer;

  factory _$QuizPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  final List<QuizModel> _quizList;
  @override
  @JsonKey()
  List<QuizModel> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  final List<int> _correctAnswer;
  @override
  @JsonKey()
  List<int> get correctAnswer {
    if (_correctAnswer is EqualUnmodifiableListView) return _correctAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctAnswer);
  }

  @override
  String toString() {
    return 'QuizPageState(isLoading: $isLoading, quizList: $quizList, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            const DeepCollectionEquality()
                .equals(other._correctAnswer, _correctAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_correctAnswer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizPageStateImplCopyWith<_$QuizPageStateImpl> get copyWith =>
      __$$QuizPageStateImplCopyWithImpl<_$QuizPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizPageStateImplToJson(
      this,
    );
  }
}

abstract class _QuizPageState implements QuizPageState {
  const factory _QuizPageState(
      {final bool isLoading,
      final List<QuizModel> quizList,
      final List<int> correctAnswer}) = _$QuizPageStateImpl;

  factory _QuizPageState.fromJson(Map<String, dynamic> json) =
      _$QuizPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  List<QuizModel> get quizList;
  @override
  List<int> get correctAnswer;
  @override
  @JsonKey(ignore: true)
  _$$QuizPageStateImplCopyWith<_$QuizPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
