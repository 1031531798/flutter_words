import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WordsPage();
  }
}

class _WordsPage extends State<WordsPage> {
  List<String> wordsList = <String>[
    "Barbecue Ribs",
    "Reuben Sandwich",
    "Hamburger",
    "Broccoli Beef",
    "Pork Chops",
    "Tacos",
    "Fries",
    "Pineapple Bun",
    "Pizza",
    "Pasta",
    "Hot Dog",
    "Sushi",
    "Donut",
    "Apple Pie",
    "Salad"
        "Clam Chowder"
  ];
  List<String> wordsCache = <String>[];
  int showIndex = 0;
  Map loveWords = {};
  Map wordsTranslateData = {};
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  nextHandle() {
    int max = wordsList.length - 1;
    int nextIndex = showIndex + 1;
    _listKey.currentState?.insertItem(0);
    wordsCache.insert(0, wordsList[showIndex]);
    setState(() {
      showIndex = nextIndex > max ? 0 : nextIndex;
    });
  }

  loveHandle() {
    String key = wordsList[showIndex];
    if (loveWords[key] == true) {
      loveWords.remove(key);
    } else {
      loveWords[wordsList[showIndex]] = true;
    }
    setState(() {
      loveWords;
    });
  }

  deleteLoveWord(String key) {
    loveWords.remove(key);
    setState(() {
      loveWords;
    });
  }

  List<Text> getLightTextList(List<String> words) {
    List<Text> list = [];
    FontWeight weight = FontWeight.normal;
    for (String word in words) {
      list.add(Text(word,
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: weight)));
      weight = FontWeight.bold;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = wordsList[showIndex].split(' ');
    bool isLove = loveWords[wordsList[showIndex]] == null;
    Icon loveIcon =
    isLove ? const Icon(Icons.favorite_border) : const Icon(Icons.favorite);
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 10),
            height: 300,
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.deepOrange,
                    Colors.deepOrange,
                    Colors.deepOrange,
                  ],
                ).createShader(bounds);
              },
              child: AnimatedList(
                key: _listKey,
                initialItemCount: wordsCache.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  String word = wordsCache[index];
                  return SizeTransition(
                    sizeFactor: animation,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (loveWords[word] != null)
                            Icon(Icons.favorite, color: primaryColor, size: 16),
                          Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(word))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
        Expanded(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: getLightTextList(words),
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: loveHandle,
                      icon: loveIcon,
                      label: const Text('Love')),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                          onPressed: nextHandle, child: const Text('Next'))),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}