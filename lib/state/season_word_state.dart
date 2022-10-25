import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/kigo.dart';

part 'season_word_state.freezed.dart';

@freezed
class SeasonWordState with _$SeasonWordState {
  const factory SeasonWordState({
    required int min,
    required int max,
    required List<Kigo> record,
  }) = _SeasonWordState;
}
