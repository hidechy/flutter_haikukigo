// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/random_season_word_viewmodel.dart';
import '../viewmodel/search_season_word_param_viewmodel.dart';

import 'search_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  List<String> seasons = ['Spring', 'Summer', 'Autumn', 'Winter', 'NewYear'];

  late WidgetRef _ref;
  late BuildContext _context;

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
                decoration: BoxDecoration(color: Colors.green[900]),
                child: dispSeasonMenu(),
              ),
              const SizedBox(height: 30),
              Container(
                width: 50,
                decoration: BoxDecoration(color: Colors.green[900]),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.search),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: GestureDetector(
            onTap: () {
              _ref
                  .watch(searchSeasonWordParamProvider.notifier)
                  .setSeason(season: seasons[i]);

              _ref
                  .watch(randomSeasonWordProvider('spring').notifier)
                  .getRandomSeasonWord(season: seasons[i]);
            },
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                seasons[i],
                style: TextStyle(
                  color: (searchSeasonWordParamState.season == seasons[i])
                      ? Colors.yellowAccent
                      : Colors.white,
                ),
              ),
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

    final size = MediaQuery.of(_context).size;

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.black.withOpacity(0.2),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height / 6,
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        randomSeasonWordState.record[index].title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(randomSeasonWordState.record[index].yomi),
                      const Divider(),
                      Text(randomSeasonWordState.record[index].detail),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                        randomSeasonWordState.record[index].length.toString()),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  randomSeasonWordState.record[index].category,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
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
