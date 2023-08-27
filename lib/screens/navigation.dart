import 'package:flutter/material.dart';
import 'package:my_squash/screens/home/home.dart';
import 'package:my_squash/screens/search/search.dart';
import 'package:my_squash/screens/settings/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<Navigation> createState() => _NavigationState();
}

int selectedIndex = 0;

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(
          () {
            selectedIndex = value;
          },
        ),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "ホーム",
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "検索",
            selectedIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "設定",
            selectedIcon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          )
        ],
        //알약모양으로 셀렉트를 애니메이션
        animationDuration: const Duration(milliseconds:  500),
      ),
      body: Center(
        child: IndexedStack(
          index: widget.index ==null ? selectedIndex:widget.index,
          children: [
            HomePage(),
            SearchPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
