import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/random_season_word_viewmodel.dart';
import '../viewmodel/search_season_word_param_viewmodel.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});

  List<String> seasons = ['Spring', 'Summer', 'Autumn', 'Winter', 'NewYear'];

  String kana =
      'あ,い,う,え,お,か,き,く,け,こ,さ,し,す,せ,そ,た,ち,つ,て,と,な,に,ぬ,ね,の,は,ひ,ふ,へ,ほ,ま,み,む,め,も,や,ゆ,よ,ら,り,る,れ,ろ,わ';

  List<String> categories = ['人事', '植物', '宗教', '地理', '動物', '時候', '天文'];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchSeasonWordParamState = ref.watch(searchSeasonWordParamProvider);

    print(searchSeasonWordParamState);

    final randomSeasonWordState = ref.watch(
      randomSeasonWordProvider(searchSeasonWordParamState.season),
    );

    print(randomSeasonWordState);

    List<String> kanaHead = kana.split(',');

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
