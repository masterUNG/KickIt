
import 'package:flutter_ui_designs/subthree/player_detail_screen.dart';
import 'package:flutter_ui_designs/subthree/AppRouter.dart';
import 'package:flutter/material.dart';

class PlayerListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Player Listing")), body: PlayerListTile());
  }
}

class PlayerListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PLAYER_DETAILS);
      },
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        height: 80.0,
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: "messi-hero-image",
                child: Image.asset(
                  "images/messi.png",
                  height: 80.0,
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Messi",
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [Text("PAC"), Text("89")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("SHO"), Text("93")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("PAS"), Text("95")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("DRI"), Text("96")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("DEF"), Text("50")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("PHY"), Text("45")],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}