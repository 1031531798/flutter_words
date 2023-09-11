import 'package:flutter/material.dart';
import 'nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LikePage();
  }
}

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LikePage();
  }
}

class _LikePage extends State<LikePage> {
  int selectIndex = 0;
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
  void pullAllWords() async {}

  changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

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

  Widget homeBody() {
    List<String> words = wordsList[showIndex].split(' ');
    bool isLove = loveWords[wordsList[showIndex]] == null;
    Icon loveIcon =
    isLove ? const Icon(Icons.favorite_border) : const Icon(Icons.favorite);
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Column(
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

  Widget loveBody() {
    final String size = loveWords.length.toString();
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have $size favorites:')),
        for (String key in loveWords.keys)
          Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () => {deleteLoveWord(key)},
              ),
              title: Text(key),
            ),
          )
      ],
    );
  }

  Widget routerBody() {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: selectIndex == 0 ? homeBody() : loveBody(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Scaffold(
              body: Row(
                children: [
                  NavBar(
                    extended: constraints.maxWidth >= 600,
                    selectIndex: selectIndex,
                    onChange: changeIndex,
                  ),
                  routerBody()
                ],
              ),
            )),
      );
    });
  }
}
