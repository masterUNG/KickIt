import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/five.dart';
import 'package:flutter_ui_designs/four.dart';
import 'package:flutter_ui_designs/one.dart';
import 'package:flutter_ui_designs/six.dart';
import 'package:flutter_ui_designs/two.dart';
import 'package:flutter_ui_designs/three.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState
    extends State<BottomNavigation> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      OneTab(),
      TwoTab(),
      ThreeTab(),
      FourTab(),
      FiveTab(),
      SixTab(),
    ];


    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Player')),
      BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Team')),
      BottomNavigationBarItem(icon: Icon(Icons.pan_tool), title: Text('All Team')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Stats')),
      BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('Stadium')),
      BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('Market')),
    ];


    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}