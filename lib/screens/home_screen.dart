// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/random_season_word_viewmodel.dart';
import '../viewmodel/search_season_word_param_viewmodel.dart';

import '../viewmodel/season_viewmodel.dart';
import 'components/kigo_card.dart';
import 'search_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  Uuid uuid = const Uuid();

  int seasonCount = 0;

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
                    style: GoogleFonts.islandMoments(
                      color: Colors.white,
                      fontSize: 60,
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
                decoration: BoxDecoration(
                  color: Colors.green[900]!.withOpacity(0.5),
                ),
                child: dispSeasonMenu(),
              ),
              const SizedBox(height: 30),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.green[900]!.withOpacity(0.5),
                ),
                child: IconButton(
                  onPressed: () {
                    if (searchSeasonWordParamState.season == '-') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green[900]!.withOpacity(0.5),
                          content: const Text(
                            'must select season',
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );

                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          season: searchSeasonWordParamState.season,
                        ),
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

    final seasonState = _ref.watch(seasonProvider);

    final size = MediaQuery.of(_context).size;

    return Column(
      children: [
        const SizedBox(height: 40),
        SizedBox(
          height: size.height * 0.6,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(bottom: 30),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: ChoiceChip(
                    backgroundColor: Colors.greenAccent.withOpacity(0.3),
                    selectedColor: Colors.yellowAccent.withOpacity(0.3),
                    label: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            seasonState.record[index].seasonJp,
                          ),
                        ),
                        Text(
                          seasonState.record[index].seasonEn,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    selected: searchSeasonWordParamState.season ==
                        seasonState.record[index].seasonEn,
                    onSelected: (_) {
                      _ref
                          .watch(searchSeasonWordParamProvider.notifier)
                          .setSeason(
                            season: seasonState.record[index].seasonEn,
                          );

                      _ref
                          .watch(randomSeasonWordProvider('-').notifier)
                          .getRandomSeasonWord(
                            season: seasonState.record[index].seasonEn,
                          );
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Container(),
            itemCount: seasonState.record.length,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  ///
  Widget dispSeasonWord() {
    final randomSeasonWordState = _ref.watch(randomSeasonWordProvider('-'));

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
