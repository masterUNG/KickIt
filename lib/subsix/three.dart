import 'package:flutter/material.dart';


class ThreeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThreeTab();
  }
}


class _ThreeTab extends State<ThreeTab> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Badge"),
        actions: <Widget>[
          new Stack(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.notifications), onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
              counter != 0 ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],
      ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
              child: FloatingActionButton(onPressed: () {
               print("Increment Counter");
               setState(() {
               counter++;});
                }, child: Icon(Icons.add),),
              )
          );
  }
}