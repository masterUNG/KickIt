

import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/subthree/player_card.dart';

class PlayerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player Detail"),
      ),
      body: Center(
        child: PlayerCard(),
      ),
    );
  }
}