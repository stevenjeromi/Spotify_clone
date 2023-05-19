import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  //const BottomBar({super.key});
  int currentindex;
  BottomBar(this.currentindex);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Color.fromRGBO(40, 40, 40, 1)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.transparent,
          Colors.transparent,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (val) {
            if (val == 0) {
              Navigator.of(context).popAndPushNamed('/');
            }
            if (val == 1) {
              Navigator.of(context).popAndPushNamed('/search');
            }
            if (val == 2) {
              Navigator.of(context).popAndPushNamed('/library');
            }
            if (val == 3) {
              Navigator.of(context).popAndPushNamed('/premium');
            }
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(179, 179, 179, 1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: currentindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.saved_search_outlined,
                size: 30,
              ),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.gripVertical,
                size: 30,
              ),
              label: 'Your Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.spotify,
                size: 30,
              ),
              label: 'premium',
            ),
          ],
        ),
      ),
    );
  }
}
