// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../models/season.dart';
import '../state/season_state.dart';

////////////////////////////////////////////////////////////

final seasonProvider =
    StateNotifierProvider.autoDispose<SeasonNotifier, SeasonState>((ref) {
  final client = ref.read(httpClientProvider);

  return SeasonNotifier(
    const SeasonState(record: []),
    client,
  )..getSeason();
});

class SeasonNotifier extends StateNotifier<SeasonState> {
  SeasonNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getSeason() async {
    await client.post(path: 'getKigoSeasonList').then((value) {
      final list = <Season>[];
      for (var i = 0; i < int.parse(value.length.toString()); i++) {
        list.add(
          Season(
            seasonEn: value[i]['season_en'].toString(),
            seasonJp: value[i]['season_jp'].toString(),
            cnt: int.parse(value[i]['cnt'].toString()),
          ),
        );
      }
      state = state.copyWith(record: list);
    });
  }
}

////////////////////////////////////////////////////////////
