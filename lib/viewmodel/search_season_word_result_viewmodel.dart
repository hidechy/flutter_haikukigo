// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../models/kigo.dart';
import '../state/search_word_param_state.dart';
import '../state/season_word_state.dart';

//////////////////////////////////////////////////////

final searchSeasonWordResultProvider = StateNotifierProvider.autoDispose<
    SearchSeasonWordResultNotifier, SeasonWordState>((ref) {
  final client = ref.read(httpClientProvider);

  return SearchSeasonWordResultNotifier(
    const SeasonWordState(
      min: 0,
      max: 0,
      record: [],
    ),
    client,
  );
});

class SearchSeasonWordResultNotifier extends StateNotifier<SeasonWordState> {
  SearchSeasonWordResultNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getSearchedSeasonWord(
      {required String title, required SearchWordParamState param}) async {
    await client.post(
      path: 'getKigoSearchedList',
      body: {
        'title': title,
        'season': param.season,
        'yomi_head': param.kanaHead,
        'length': param.length,
        'category': param.category
      },
    ).then((value) {
      final list = <Kigo>[];
      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final oneData = value['list'][i];
        list.add(
          Kigo(
            title: oneData['title'].toString(),
            yomi: oneData['yomi'].toString(),
            detail: oneData['detail'].toString(),
            length: int.parse(oneData['length'].toString()),
            category: oneData['category'].toString(),
          ),
        );
      }

      state = SeasonWordState(
        min: int.parse(value['min'].toString()),
        max: int.parse(value['max'].toString()),
        record: list,
      );
    });
  }
}

//////////////////////////////////////////////////////
