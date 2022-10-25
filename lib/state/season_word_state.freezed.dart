// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'season_word_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeasonWordState {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  List<Kigo> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeasonWordStateCopyWith<SeasonWordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonWordStateCopyWith<$Res> {
  factory $SeasonWordStateCopyWith(
          SeasonWordState value, $Res Function(SeasonWordState) then) =
      _$SeasonWordStateCopyWithImpl<$Res, SeasonWordState>;
  @useResult
  $Res call({int min, int max, List<Kigo> record});
}

/// @nodoc
class _$SeasonWordStateCopyWithImpl<$Res, $Val extends SeasonWordState>
    implements $SeasonWordStateCopyWith<$Res> {
  _$SeasonWordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? record = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Kigo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeasonWordStateCopyWith<$Res>
    implements $SeasonWordStateCopyWith<$Res> {
  factory _$$_SeasonWordStateCopyWith(
          _$_SeasonWordState value, $Res Function(_$_SeasonWordState) then) =
      __$$_SeasonWordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max, List<Kigo> record});
}

/// @nodoc
class __$$_SeasonWordStateCopyWithImpl<$Res>
    extends _$SeasonWordStateCopyWithImpl<$Res, _$_SeasonWordState>
    implements _$$_SeasonWordStateCopyWith<$Res> {
  __$$_SeasonWordStateCopyWithImpl(
      _$_SeasonWordState _value, $Res Function(_$_SeasonWordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? record = null,
  }) {
    return _then(_$_SeasonWordState(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Kigo>,
    ));
  }
}

/// @nodoc

class _$_SeasonWordState implements _SeasonWordState {
  const _$_SeasonWordState(
      {required this.min, required this.max, required final List<Kigo> record})
      : _record = record;

  @override
  final int min;
  @override
  final int max;
  final List<Kigo> _record;
  @override
  List<Kigo> get record {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'SeasonWordState(min: $min, max: $max, record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeasonWordState &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, min, max, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeasonWordStateCopyWith<_$_SeasonWordState> get copyWith =>
      __$$_SeasonWordStateCopyWithImpl<_$_SeasonWordState>(this, _$identity);
}

abstract class _SeasonWordState implements SeasonWordState {
  const factory _SeasonWordState(
      {required final int min,
      required final int max,
      required final List<Kigo> record}) = _$_SeasonWordState;

  @override
  int get min;
  @override
  int get max;
  @override
  List<Kigo> get record;
  @override
  @JsonKey(ignore: true)
  _$$_SeasonWordStateCopyWith<_$_SeasonWordState> get copyWith =>
      throw _privateConstructorUsedError;
}
