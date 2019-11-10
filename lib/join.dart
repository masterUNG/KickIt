import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/joinbar/joins.dart';
import 'package:flutter_ui_designs/joinbar/myappbar.dart';
import 'package:flutter_ui_designs/joinbar/myflexiableappbar.dart';


class Join extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Join();
  }
}

  class _Join extends State<Join> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyAppBar(),
              pinned: true,
              expandedHeight: 210.0,
              backgroundColor: Colors.black87.withBlue(7),

              flexibleSpace: FlexibleSpaceBar(
                background: MyFlexiableAppBar(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [SliverListDetail()],
              ),
            ),
            SliverFillRemaining(
                child: Joins())

            ],
        )
    );
  }
    Widget SliverListDetail() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text('JOIN THE TEAM'),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              )
            ]),
      );
    }

}
