import 'package:flutter/material.dart';
import 'package:my_squash/screens/home/home.dart';
import 'package:my_squash/screens/score/score.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<Navigation> createState() => _NavigationState();
}


class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  var _controller = PageController();
  var _pages = [
          HomePage(),
          ScorePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(
          () {
            selectedIndex = value;
            _controller.jumpToPage(selectedIndex);
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
            icon: Icon(Icons.score),
            label: "スコア",
            selectedIcon: Icon(
              Icons.score,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
        //알약모양으로 셀렉트를 애니메이션
        animationDuration: const Duration(milliseconds:  500),
      ),

      body: PageView(
        controller: _controller,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      // body: Center(
      //   // child: IndexedStack(
      //   //   index: widget.index ==null ? selectedIndex:widget.index,
      //   //   children: [
      //   //     HomePage(),
      //   //     ScorePage(),
      //   //     ProfilePage(),
      //   //   ],
      //   // ),
      ),
    );
  }
}
