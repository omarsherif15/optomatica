import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optomatica/consts/colors.dart';
import 'package:optomatica/consts/fonts.dart';
import 'package:optomatica/screens/comunity_screen.dart';
import 'package:optomatica/screens/race_screen.dart';
import 'package:optomatica/screens/run_screen.dart';
import 'package:optomatica/widgets/bottomNavigation.dart';

import '../data_model/race_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:darkBlue ),
          flexibleSpace: const Image(
            image: AssetImage('assets/background/Appbar.png'),
            fit: BoxFit.cover,
          ),
          toolbarHeight: 57,
          title:  Row(
            children: [
              const Image(image: AssetImage('assets/background/Logo.png')),
              Text('RACEMATE',style: TextStyle(
                  color: yellow,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
              ),),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.notifications,color: yellow,)
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor:yellow,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){},
                          icon: Icon(Icons.person,color: darkBlue)
                                            ),
                      ),
                  ),
                ],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Container(
              color: darkBlue,
              child: TabBar(

                tabs: tabBar,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 5,
                indicatorColor: yellow,

              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const RunScreen(),
            const CommunityScreen(),
            RacesScreen()
          ],
        ),
        bottomNavigationBar: const BottomNavigation()
      ),
    );
  }

  List <Widget> tabBar = [
    Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Text('RUN',style: TextStyle(fontWeight: FontWeight.w900,color: tabBarText,fontSize: 16,fontFamily: robotoBold),)
    ),
    Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Text('COMMUNITY',style: TextStyle(fontWeight: FontWeight.w900,color: tabBarText,fontSize: 14,fontFamily: robotoBold),)
    ),
    Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Text('RACES',style: TextStyle(fontWeight: FontWeight.w900,color: tabBarText,fontSize: 16,fontFamily: robotoBold),)
    ),
  ];
}
