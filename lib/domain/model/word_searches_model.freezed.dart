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
  @JsonKey(name: 'my_search')
  List<Map<String, String>> get mySearch => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'my_search') List<Map<String, String>> mySearch});
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
    Object? mySearch = null,
  }) {
    return _then(_value.copyWith(
      mySearch: null == mySearch
          ? _value.mySearch
          : mySearch // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
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
  $Res call({@JsonKey(name: 'my_search') List<Map<String, String>> mySearch});
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
    Object? mySearch = null,
  }) {
    return _then(_$WordSearchesModelImpl(
      mySearch: null == mySearch
          ? _value._mySearch
          : mySearch // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordSearchesModelImpl implements _WordSearchesModel {
  const _$WordSearchesModelImpl(
      {@JsonKey(name: 'my_search')
      required final List<Map<String, String>> mySearch})
      : _mySearch = mySearch;

  factory _$WordSearchesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordSearchesModelImplFromJson(json);

  final List<Map<String, String>> _mySearch;
  @override
  @JsonKey(name: 'my_search')
  List<Map<String, String>> get mySearch {
    if (_mySearch is EqualUnmodifiableListView) return _mySearch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mySearch);
  }

  @override
  String toString() {
    return 'WordSearchesModel(mySearch: $mySearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSearchesModelImpl &&
            const DeepCollectionEquality().equals(other._mySearch, _mySearch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mySearch));

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
          {@JsonKey(name: 'my_search')
          required final List<Map<String, String>> mySearch}) =
      _$WordSearchesModelImpl;

  factory _WordSearchesModel.fromJson(Map<String, dynamic> json) =
      _$WordSearchesModelImpl.fromJson;

  @override
  @JsonKey(name: 'my_search')
  List<Map<String, String>> get mySearch;
  @override
  @JsonKey(ignore: true)
  _$$WordSearchesModelImplCopyWith<_$WordSearchesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
