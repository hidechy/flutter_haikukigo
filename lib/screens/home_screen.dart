// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/random_season_word_viewmodel.dart';
import '../viewmodel/search_season_word_param_viewmodel.dart';

import 'components/kigo_card.dart';
import 'search_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  var uuid = const Uuid();

  List<String> seasons = ['Spring', 'Summer', 'Autumn', 'Winter', 'NewYear'];

  List<String> seasonsJp = ['春', '夏', '秋', '冬', '新年'];

  late WidgetRef _ref;
  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    _context = context;

    final searchSeasonWordParamState = ref.watch(searchSeasonWordParamProvider);

    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    searchSeasonWordParamState.season,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: dispSeasonWord()),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                width: 50,
                decoration:
                    BoxDecoration(color: Colors.green[900]!.withOpacity(0.5)),
                child: dispSeasonMenu(),
              ),
              const SizedBox(height: 30),
              Container(
                width: 50,
                decoration:
                    BoxDecoration(color: Colors.green[900]!.withOpacity(0.5)),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  Widget dispSeasonMenu() {
    final searchSeasonWordParamState =
        _ref.watch(searchSeasonWordParamProvider);

    final list = <Widget>[];

    list.add(const SizedBox(height: 100));

    for (var i = 0; i < seasons.length; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: RotatedBox(
            quarterTurns: 1,
            child: ChoiceChip(
              backgroundColor: Colors.greenAccent.withOpacity(0.3),
              selectedColor: Colors.yellowAccent.withOpacity(0.3),
              label: Text(
                seasons[i],
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              selected: searchSeasonWordParamState.season == seasons[i],
              onSelected: (_) {
                _ref
                    .watch(searchSeasonWordParamProvider.notifier)
                    .setSeason(season: seasons[i]);

                _ref
                    .watch(randomSeasonWordProvider('spring').notifier)
                    .getRandomSeasonWord(season: seasons[i]);
              },
            ),
          ),
        ),
      );
    }

    return Column(
      children: list,
    );
  }

  ///
  Widget dispSeasonWord() {
    final randomSeasonWordState =
        _ref.watch(randomSeasonWordProvider('spring'));

    final searchSeasonWordParamState =
        _ref.watch(searchSeasonWordParamProvider);

    final size = MediaQuery.of(_context).size;

    return ListView.separated(
      key: PageStorageKey(uuid.v1()),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return KigoCard(
          size: size,
          kigo: randomSeasonWordState.record[index],
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.white.withOpacity(0.5),
        thickness: 2,
      ),
      itemCount: randomSeasonWordState.record.length,
    );
  }
}
