import 'package:flutter/material.dart';
import 'package:words_record/view/parallax/parallax.dart';
import 'package:words_record/view/words/words.dart';
import 'nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  int selectIndex = 0;

  changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }
  Widget foodBody () {
    return  const Center(
      child: ParallaxPage(),
    );
  }

  Widget routerBody() {
    const Map pageMap = {
      0: WordsPage(),
      1: ParallaxPage()
    };
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: pageMap[selectIndex],
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
