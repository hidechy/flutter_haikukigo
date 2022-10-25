import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_word_param_state.freezed.dart';

@freezed
class SearchWordParamState with _$SearchWordParamState {
  const factory SearchWordParamState({
    required String season,
    required String kanaHead,
    required int length,
    required String category,
  }) = _SearchWordParamState;
}
