import 'package:haikukigo/state/search_word_param_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  Future<void> setKanaHead({required String kanaHead}) async {}

  Future<void> setLength({required int length}) async {}

  Future<void> setCategory({required String category}) async {}
}

//////////////////////////////////////////////////////
