import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/five.dart';
import 'package:flutter_ui_designs/four.dart';
import 'package:flutter_ui_designs/one.dart';
import 'package:flutter_ui_designs/six.dart';
import 'package:flutter_ui_designs/two.dart';
import 'package:flutter_ui_designs/three.dart';



class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    OneTab(),
    TwoTab(),
    ThreeTab(),
    FourTab(),
    FiveTab(),
    SixTab(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,


    items: [
      new BottomNavigationBarItem(
        title: new Text('Home'),
        icon: new Stack(
            children: <Widget>[
              new Icon(Icons.home),
              new Positioned(  // draw a red marble
                top: 0.0,
                right: 0.0,
                child: new Icon(Icons.brightness_1, size: 8.0,
                    color: Colors.redAccent),
              )
            ]
        ),
      ),

      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black12,
          ),
        ),
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black12,
          ),
        ),
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black12,
          ),
        ),
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black12,
          ),
        ),
      ),
      BottomNavigationBarItem(
          icon: new Stack(children: <Widget>[
            new Icon(Icons.favorite),
            new Positioned(
                top: -1.0,
                right: -1.0,
                child: new Stack(
                  children: <Widget>[
                    new Icon(
                      Icons.brightness_1,
                      size: 12.0,
                      color: const Color(0xFF2845E7),
                    ),
                  ],
                ))
          ]),
          title: new Text(
            "Stories",
          )),


    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}