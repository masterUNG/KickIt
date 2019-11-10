import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/myteambar/teamapi.dart';
import 'package:flutter_ui_designs/myteambar/teams.dart';
import 'package:flutter_ui_designs/myteambar/myappbar.dart';
import 'package:flutter_ui_designs/myteambar/myflexiableappbar.dart';


class MyTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTeam();
  }
}

class _MyTeam extends State<MyTeam> {

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
                child: LiveTrading(testCrypto))

          ],
        )
    );
  }
  Widget SliverListDetail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('MEMBER'),
            ),
            Container(
              child: Text('LEVEL'),
            ),
          ]),
    );
  }

}
