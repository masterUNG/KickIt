import 'package:flutter/material.dart';

import 'package:flutter_ui_designs/screens/atro/atro_login_screen.dart';
import 'package:flutter_ui_designs/screens/atro/feeds_loading.dart';




class AtroScreen extends StatefulWidget {
  static String uiName = 'Fuck';

  @override
  _AtroScreenState createState() => _AtroScreenState();
}

class _AtroScreenState extends State<AtroScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          onPageChanged: (page) {},
          children: <Widget>[AtroLoginScreen(),FeedsLoading()],
        ));
  }
}