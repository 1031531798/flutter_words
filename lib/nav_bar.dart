import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int selectIndex;
  final bool extended;
  final onChange;
  const NavBar({super.key, required this.extended, required this.selectIndex, required this.onChange});


  @override
  State<NavBar> createState() {
    return _NavBarState();
  }
}
class _NavBarState extends State<NavBar> {
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: widget.selectIndex,
      groupAlignment: groupAlignment,
      labelType: widget.extended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
      extended: widget.extended,
      onDestinationSelected: (int index) {
        widget.onChange(index);
      },
      leading: showLeading
          ? FloatingActionButton(
        elevation: 0,
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      )
          : const SizedBox(),
      trailing: showTrailing
          ? IconButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: const Icon(Icons.more_horiz_rounded),
      )
          : const SizedBox(),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: Text('Love'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.food_bank_outlined),
          selectedIcon: Icon(Icons.food_bank),
          label: Text('Food'),
        ),
      ],
    );
  }
}