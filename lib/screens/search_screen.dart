import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/random_season_word_viewmodel.dart';
import '../viewmodel/search_season_word_param_viewmodel.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchSeasonWordParamState = ref.watch(searchSeasonWordParamProvider);

    print(searchSeasonWordParamState);

    final randomSeasonWordState = ref.watch(
      randomSeasonWordProvider(searchSeasonWordParamState.season),
    );

    print(randomSeasonWordState);

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
