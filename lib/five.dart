import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/login/login_screen.dart';
import 'package:flutter_ui_designs/subsix//NewsArticle.dart';
import 'package:flutter_ui_designs/subsix//NewsHelper.dart';

class FiveTab extends StatefulWidget {
  @override
  _FiveTabState createState() {
    return _FiveTabState();
  }
}

class _FiveTabState extends State<FiveTab> {


  Future<void> signOutProcess()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response){
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route)=>false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Stadium",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search, color: Colors.grey),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          NewsArticle article = NewsHelper.getArticle(position);

          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 1),
            child: Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.categoryTitle,
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0, 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              article.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21.0),
                            ),
                            flex: 3,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                height: 80.0,
                                width: 200.0,
                                child: Image.asset(
                                  "assets/" + article.imageAssetName,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              article.author,
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              article.date + " . " + article.readTime,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(Icons.bookmark_border),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: NewsHelper.articleCount,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 90.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "John Doe",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "See profile",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Home",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Audio",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bookmarks",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Interests",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Become a member",
                          style: TextStyle(fontSize: 18.0, color: Colors.teal),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "New Story",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Sign Out'),
                          subtitle: Text('Sign Out and Back Home'),
                          onTap: (){
                            signOutProcess();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
