// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'season_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeasonState {
  List<Season> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeasonStateCopyWith<SeasonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonStateCopyWith<$Res> {
  factory $SeasonStateCopyWith(
          SeasonState value, $Res Function(SeasonState) then) =
      _$SeasonStateCopyWithImpl<$Res, SeasonState>;
  @useResult
  $Res call({List<Season> record});
}

/// @nodoc
class _$SeasonStateCopyWithImpl<$Res, $Val extends SeasonState>
    implements $SeasonStateCopyWith<$Res> {
  _$SeasonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Season>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeasonStateCopyWith<$Res>
    implements $SeasonStateCopyWith<$Res> {
  factory _$$_SeasonStateCopyWith(
          _$_SeasonState value, $Res Function(_$_SeasonState) then) =
      __$$_SeasonStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Season> record});
}

/// @nodoc
class __$$_SeasonStateCopyWithImpl<$Res>
    extends _$SeasonStateCopyWithImpl<$Res, _$_SeasonState>
    implements _$$_SeasonStateCopyWith<$Res> {
  __$$_SeasonStateCopyWithImpl(
      _$_SeasonState _value, $Res Function(_$_SeasonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$_SeasonState(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Season>,
    ));
  }
}

/// @nodoc

class _$_SeasonState implements _SeasonState {
  const _$_SeasonState({required final List<Season> record}) : _record = record;

  final List<Season> _record;
  @override
  List<Season> get record {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'SeasonState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeasonState &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeasonStateCopyWith<_$_SeasonState> get copyWith =>
      __$$_SeasonStateCopyWithImpl<_$_SeasonState>(this, _$identity);
}

abstract class _SeasonState implements SeasonState {
  const factory _SeasonState({required final List<Season> record}) =
      _$_SeasonState;

  @override
  List<Season> get record;
  @override
  @JsonKey(ignore: true)
  _$$_SeasonStateCopyWith<_$_SeasonState> get copyWith =>
      throw _privateConstructorUsedError;
}
