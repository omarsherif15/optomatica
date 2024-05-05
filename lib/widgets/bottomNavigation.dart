import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../consts/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: HexColor('#CDD3E4'), blurRadius: 15)]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: lightText),
          backgroundColor: Colors.white,
          iconSize: 24,
          fixedColor: lightText,
          elevation: 20,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: lightText,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.track_changes,
                  color: lightText,
                ),
                label: 'Train'),
            const BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/background/AvatarLogo.png')),
                label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: lightText,
                ),
                label: 'Explore'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph,
                color: lightText,
              ),
              label: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}
