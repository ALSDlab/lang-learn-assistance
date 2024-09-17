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
  @JsonKey(name: 'my_sentences')
  List<Map<String, dynamic>> get mySentences =>
      throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'my_sentences') List<Map<String, dynamic>> mySentences});
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
    Object? mySentences = null,
  }) {
    return _then(_value.copyWith(
      mySentences: null == mySentences
          ? _value.mySentences
          : mySentences // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
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
      {@JsonKey(name: 'my_sentences') List<Map<String, dynamic>> mySentences});
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
    Object? mySentences = null,
  }) {
    return _then(_$DaySentencesModelImpl(
      mySentences: null == mySentences
          ? _value._mySentences
          : mySentences // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DaySentencesModelImpl implements _DaySentencesModel {
  const _$DaySentencesModelImpl(
      {@JsonKey(name: 'my_sentences')
      required final List<Map<String, dynamic>> mySentences})
      : _mySentences = mySentences;

  factory _$DaySentencesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DaySentencesModelImplFromJson(json);

  final List<Map<String, dynamic>> _mySentences;
  @override
  @JsonKey(name: 'my_sentences')
  List<Map<String, dynamic>> get mySentences {
    if (_mySentences is EqualUnmodifiableListView) return _mySentences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mySentences);
  }

  @override
  String toString() {
    return 'DaySentencesModel(mySentences: $mySentences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaySentencesModelImpl &&
            const DeepCollectionEquality()
                .equals(other._mySentences, _mySentences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_mySentences));

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
          {@JsonKey(name: 'my_sentences')
          required final List<Map<String, dynamic>> mySentences}) =
      _$DaySentencesModelImpl;

  factory _DaySentencesModel.fromJson(Map<String, dynamic> json) =
      _$DaySentencesModelImpl.fromJson;

  @override
  @JsonKey(name: 'my_sentences')
  List<Map<String, dynamic>> get mySentences;
  @override
  @JsonKey(ignore: true)
  _$$DaySentencesModelImplCopyWith<_$DaySentencesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
