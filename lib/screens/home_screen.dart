import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_designs/screens/atro/atro.dart';
import 'package:flutter/cupertino.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: ListView(padding: EdgeInsets.zero,
            children: <Widget>[
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/atro/B1.jpg"),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                    children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 25,
                                  )
                              ,Container(
                               alignment: Alignment.centerRight,
                                  child: FlatButton(
                                    child: Text(
                                    'Skip',
                                    style: TextStyle(
                                    fontSize: 14.0,
                                     color: Color(0xFFFFFFFF)
                                      ,fontFamily: 'Montserrat'
                                    )
                                    )
                                    ,onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => AtroScreen()));
                                      }
                                     )
                                   )
                                  ,SizedBox(
                                    height: 30,
                                  ),
                                   Container(
                                       child: Text("Welcome to",
                                           style: TextStyle(
                                               fontSize: 35.0,
                                               color: Colors.white
                                               ,fontFamily: 'Montserrat'
                                           )
                                       )
                                   )
                                  ,SizedBox(
                                    height: 10,
                                  )
                                  ,Container(
                                      child: Text("Soccer community",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.white
                                              ,fontFamily: 'Montserrat'
                                          )
                                      )
                                  )
                                  ,SizedBox(
                                    height: 40,
                                  )
                                  ,Container(
                                      child: Image.asset(
                                        'assets/atro/logo.png',
                                      )
                                  )
                                  ,SizedBox(
                                    height: 20,
                                  )
                                 ,Container(
                                      child: Text("On the pitch, We equal",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.green
                                              ,fontFamily: 'Montserrat'
                                          )
                                      )
                                  )
                                  ,SizedBox(
                                    height: 100,
                                  ),
                              _buildListItem(
                               context: context, name: AtroScreen.uiName, route: AtroScreen()
                                    )
                                   ]
                                  )
                                  )
                                ]
                            )
                         ]
                        )
                      )
                    ]
                  )
                );
  }



  _buildListItem({
    BuildContext context,
    String name,
    Widget route,
  }) {

    return Column(
        children: <Widget>[
        FittedBox(
          fit: BoxFit.scaleDown,
            child: SizedBox(
                height: 150,
                width: 150,
                child: RaisedButton(
                  child: Image.asset(
                      'assets/atro/Football.png'),
                  shape: StadiumBorder(),
                  color: Colors.white38,

                    onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => AtroScreen()));

                   }
                   )
            )
         )
          ,SizedBox(
            height: 10,
          )
          ,Container(
              child: Text("Kick Here",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white70
                      ,fontFamily: 'Montserrat'
                  )
              )
          )
          ,SizedBox(
            height: 115,
          ),
        ]
    );
  }
}
