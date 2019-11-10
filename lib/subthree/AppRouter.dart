
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/subthree/player_detail_screen.dart';
import 'package:flutter_ui_designs/subthree/player_listing_screen.dart';
import 'package:flutter/cupertino.dart';

const String DASHBOARD = "/";
const String PLAYER_DETAILS = "/playerDetail";
RouteFactory factory = (RouteSettings settings) {

  switch (settings.name) {
    case DASHBOARD:
      return CustomMaterialRouter(builder: (_) => PlayerListingScreen(), settings: settings);
    case PLAYER_DETAILS:
      return CustomMaterialRouter(builder: (_) => PlayerDetailScreen(), settings: settings);
  }
  assert(false);
};

class CustomMaterialRouter extends MaterialPageRoute {
  CustomMaterialRouter({WidgetBuilder builder, RouteSettings settings}) : super(builder: builder, settings: settings);

  @override Duration get transitionDuration => const Duration(milliseconds: 500);

  @override Widget buildTransitions(BuildContext context, Animation animation, Animation secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(opacity: animation, child: child);
  }
}