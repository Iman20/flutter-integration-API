import 'package:flutter/material.dart';
import 'package:mobcom_final_task/pages/list_favorite.dart';
import 'package:mobcom_final_task/pages/list_user.dart';

class TabHome extends StatefulWidget{
  static String tag = 'tabhome-page';

  @override
  TabHomeState createState() => new TabHomeState();

}

class TabHomeState extends State<TabHome>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.favorite),)
              ],
            ),
            title: Text('Random Users'),
            backgroundColor: Colors.black,
          ),
          body: TabBarView(
            children: <Widget>[
              ListUser(),
              ListFavorite()
            ],
          ),
        ),
      ),
    );
  }
}