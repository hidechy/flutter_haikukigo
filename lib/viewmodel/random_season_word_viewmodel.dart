// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../models/kigo.dart';
import '../state/season_word_state.dart';

//////////////////////////////////////////////////////

final randomSeasonWordProvider = StateNotifierProvider.autoDispose
    .family<RandomSeasonWordNotifier, SeasonWordState, String>((ref, season) {
  final client = ref.read(httpClientProvider);

  return RandomSeasonWordNotifier(
    const SeasonWordState(min: 0, max: 0, record: []),
    client,
  )..getRandomSeasonWord(season: season);
});

class RandomSeasonWordNotifier extends StateNotifier<SeasonWordState> {
  RandomSeasonWordNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getRandomSeasonWord({required String season}) async {
    if (season == '-') {
      return;
    }

    await client.post(
      path: 'getKigoSeasonRandomList',
      body: {'season': season},
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
            cnt: int.parse(oneData['cnt'].toString()),
            seasonCnt: int.parse(oneData['seasonCnt'].toString()),
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
