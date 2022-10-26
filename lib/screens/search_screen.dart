// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:haikukigo/screens/components/kigo_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/random_season_word_viewmodel.dart';
import '../viewmodel/search_season_word_param_viewmodel.dart';
import '../viewmodel/search_season_word_result_viewmodel.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});

  List<String> seasons = ['Spring', 'Summer', 'Autumn', 'Winter', 'NewYear'];

  String kana =
      'あ,い,う,え,お,か,き,く,け,こ,さ,し,す,せ,そ,た,ち,つ,て,と,な,に,ぬ,ね,の,は,ひ,ふ,へ,ほ,ま,み,む,め,も,や,ゆ,よ,ら,り,る,れ,ろ,わ';

  List<String> categories = ['人事', '植物', '宗教', '地理', '動物', '時候', '天文'];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final searchSeasonWordParamState = ref.watch(searchSeasonWordParamProvider);

    final randomSeasonWordState = ref.watch(
      randomSeasonWordProvider(searchSeasonWordParamState.season),
    );

    final searchSeasonWordResultState =
        ref.watch(searchSeasonWordResultProvider);

//    print(searchSeasonWordResultState);

    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                searchSeasonWordParamState.season,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          makeKanaBlock(),
          Row(
            children: [
              SizedBox(
                width: (size.width * 0.8) - 20,
                height: (size.height * 0.4) - 50,
                child: makeCategoryBlock(),
              ),
              SizedBox(
                width: size.width * 0.2,
                height: (size.height * 0.4) - 50,
                child: SingleChildScrollView(
                  child: dispKigoLength(
                    min: randomSeasonWordState.min,
                    max: randomSeasonWordState.max,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent.withOpacity(0.3)),
            onPressed: () {
              ref
                  .watch(searchSeasonWordResultProvider.notifier)
                  .getSearchedSeasonWord(param: searchSeasonWordParamState);

              showDialog(
                context: context,
                builder: (_) {
                  return Dialog(
                    backgroundColor: Colors.blueGrey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    insetPadding: const EdgeInsets.all(30),
                    child: KigoAlert(),
                  );
                },
              );
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              child: const Text('search'),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget makeKanaBlock() {
    final kanaHead = kana.split(',');

    final size = MediaQuery.of(_context).size;

    final searchSeasonWordParamState =
        _ref.watch(searchSeasonWordParamProvider);

    return SizedBox(
      height: size.height * 0.4,
      child: SingleChildScrollView(
        child: Wrap(
          children: kanaHead.map((val) {
            return GestureDetector(
              onTap: () {
                _ref
                    .watch(searchSeasonWordParamProvider.notifier)
                    .setKanaHead(kanaHead: val);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (searchSeasonWordParamState.kanaHead == val)
                      ? Colors.yellowAccent.withOpacity(0.5)
                      : Colors.green[900]!.withOpacity(0.5),
                ),
                child: Text(val),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  ///
  Widget makeCategoryBlock() {
    final searchSeasonWordParamState =
        _ref.watch(searchSeasonWordParamProvider);

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _ref
                .watch(searchSeasonWordParamProvider.notifier)
                .setCategory(category: categories[index]);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: (searchSeasonWordParamState.category == categories[index])
                  ? Colors.yellowAccent.withOpacity(0.5)
                  : Colors.green[900]!.withOpacity(0.5),
            ),
            child: Text(categories[index]),
          ),
        );
      },
      separatorBuilder: (context, index) => Container(),
      itemCount: categories.length,
    );
  }

  ///
  Widget dispKigoLength({required int min, required int max}) {
    final searchSeasonWordParamState =
        _ref.watch(searchSeasonWordParamProvider);

    final list = <Widget>[];

    for (var i = min; i <= max; i++) {
      list.add(
        Column(
          children: [
            GestureDetector(
              onTap: () {
                _ref
                    .watch(searchSeasonWordParamProvider.notifier)
                    .setLength(length: i);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: (searchSeasonWordParamState.length == i)
                      ? Colors.yellowAccent.withOpacity(0.5)
                      : Colors.green[900]!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(i.toString()),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    return Column(
      children: list,
    );
  }
}

///////////////////////////////////////////////////////

class KigoAlert extends ConsumerWidget {
  const KigoAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchSeasonWordResultState =
        ref.watch(searchSeasonWordResultProvider);

    Size size = MediaQuery.of(context).size;

    List<Widget> list = [];

    list.add(
      Column(
        children: [
          Text(searchSeasonWordResultState.record.length.toString()),
          Divider(),
        ],
      ),
    );

    for (var i = 0; i < searchSeasonWordResultState.record.length; i++) {
      list.add(
        KigoCard(
          size: size,
          kigo: searchSeasonWordResultState.record[i],
        ),
      );
    }

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height - 50,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
        ),
      ),
    );
  }
}
