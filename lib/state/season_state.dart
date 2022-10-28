import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/season.dart';

part 'season_state.freezed.dart';

@freezed
class SeasonState with _$SeasonState {
  const factory SeasonState({
    required List<Season> record,
  }) = _SeasonState;
}
