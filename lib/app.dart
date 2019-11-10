
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'one.dart';
import 'two.dart';
import 'three.dart';
import 'four.dart';
import 'five.dart';
import 'six.dart';


class KickItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KickItHomePage(),
    );
  }
}

class KickItHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              title: Container(),
              icon: Image.asset(
                'assets/Player.png',
              ),
              activeIcon: Image.asset(
                'assets/Player1.png',
              ),
          ),

          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              'assets/Team.png',
            ),
            activeIcon: Image.asset(
              'assets/Team1.png',
            ),
          ),

          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              'assets/AllTeam1.png',
            ),
            activeIcon: Image.asset(
              'assets/AllTeam.png',
            ),
          ),

          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              'assets/Stats.png',
            ),
            activeIcon: Image.asset(
              'assets/Stats1.png',
            ),
          ),

          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              'assets/Stadium.png',
            ),
            activeIcon: Image.asset(
              'assets/Stadium1.png',
            ),
          ),

          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              'assets/Market.png',
            ),
            activeIcon: Image.asset(
              'assets/Market1.png',
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: OneTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: TwoTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ThreeTab(),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FourTab(),
              );
            });
            break;
          case 4:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FiveTab(),
              );
            });
            break;
          case 5:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SixTab(),
              );
            });
            break;

        }
        return returnValue;
      },
    );
  }
}