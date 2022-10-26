import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/search_word_param_state.dart';

//////////////////////////////////////////////////////

final searchSeasonWordParamProvider = StateNotifierProvider.autoDispose<
    SearchSeasonWordParamNotifier, SearchWordParamState>((ref) {
  return SearchSeasonWordParamNotifier(
    const SearchWordParamState(
      season: 'Spring',
      kanaHead: '',
      length: 0,
      category: '',
    ),
  );
});

class SearchSeasonWordParamNotifier
    extends StateNotifier<SearchWordParamState> {
  SearchSeasonWordParamNotifier(super.state);

  Future<void> setSeason({required String season}) async {
    state = state.copyWith(season: season);
  }

  Future<void> setKanaHead({required String kanaHead}) async {
    state =
        state.copyWith(kanaHead: (state.kanaHead == kanaHead) ? '' : kanaHead);
  }

  Future<void> setCategory({required String category}) async {
    state =
        state.copyWith(category: (state.category == category) ? '' : category);
  }

  Future<void> setLength({required int length}) async {
    state = state.copyWith(length: (state.length == length) ? 0 : length);
  }
}

//////////////////////////////////////////////////////
