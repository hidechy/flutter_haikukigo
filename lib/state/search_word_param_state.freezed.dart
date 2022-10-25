// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_word_param_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchWordParamState {
  String get season => throw _privateConstructorUsedError;
  String get kanaHead => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchWordParamStateCopyWith<SearchWordParamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchWordParamStateCopyWith<$Res> {
  factory $SearchWordParamStateCopyWith(SearchWordParamState value,
          $Res Function(SearchWordParamState) then) =
      _$SearchWordParamStateCopyWithImpl<$Res, SearchWordParamState>;
  @useResult
  $Res call({String season, String kanaHead, int length, String category});
}

/// @nodoc
class _$SearchWordParamStateCopyWithImpl<$Res,
        $Val extends SearchWordParamState>
    implements $SearchWordParamStateCopyWith<$Res> {
  _$SearchWordParamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = null,
    Object? kanaHead = null,
    Object? length = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      kanaHead: null == kanaHead
          ? _value.kanaHead
          : kanaHead // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchWordParamStateCopyWith<$Res>
    implements $SearchWordParamStateCopyWith<$Res> {
  factory _$$_SearchWordParamStateCopyWith(_$_SearchWordParamState value,
          $Res Function(_$_SearchWordParamState) then) =
      __$$_SearchWordParamStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String season, String kanaHead, int length, String category});
}

/// @nodoc
class __$$_SearchWordParamStateCopyWithImpl<$Res>
    extends _$SearchWordParamStateCopyWithImpl<$Res, _$_SearchWordParamState>
    implements _$$_SearchWordParamStateCopyWith<$Res> {
  __$$_SearchWordParamStateCopyWithImpl(_$_SearchWordParamState _value,
      $Res Function(_$_SearchWordParamState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = null,
    Object? kanaHead = null,
    Object? length = null,
    Object? category = null,
  }) {
    return _then(_$_SearchWordParamState(
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      kanaHead: null == kanaHead
          ? _value.kanaHead
          : kanaHead // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchWordParamState implements _SearchWordParamState {
  const _$_SearchWordParamState(
      {required this.season,
      required this.kanaHead,
      required this.length,
      required this.category});

  @override
  final String season;
  @override
  final String kanaHead;
  @override
  final int length;
  @override
  final String category;

  @override
  String toString() {
    return 'SearchWordParamState(season: $season, kanaHead: $kanaHead, length: $length, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchWordParamState &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.kanaHead, kanaHead) ||
                other.kanaHead == kanaHead) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, season, kanaHead, length, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchWordParamStateCopyWith<_$_SearchWordParamState> get copyWith =>
      __$$_SearchWordParamStateCopyWithImpl<_$_SearchWordParamState>(
          this, _$identity);
}

abstract class _SearchWordParamState implements SearchWordParamState {
  const factory _SearchWordParamState(
      {required final String season,
      required final String kanaHead,
      required final int length,
      required final String category}) = _$_SearchWordParamState;

  @override
  String get season;
  @override
  String get kanaHead;
  @override
  int get length;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_SearchWordParamStateCopyWith<_$_SearchWordParamState> get copyWith =>
      throw _privateConstructorUsedError;
}
