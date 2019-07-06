import 'package:flutter/material.dart';
import 'package:mobcom_final_task/pages/tab_home.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class OnBoarding extends StatelessWidget{
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/logo.png'),
        body: Text(
          'Feels app to search people',
        ),
        title: Text(
          'Welcome',
        ),
        textStyle: TextStyle(fontFamily: 'Nunito', color: Colors.white),
        mainImage: Image.asset(
          'assets/logo.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
    )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/logo.png',
      body: Text(
        'Meet with many people your like',
      ),
      title: Text('Peoples'),
      mainImage: Image.asset(
        'assets/logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'Nunito', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/logo.png',
      body: Text(
        'You can get new friend in every day',
      ),
      title: Text('Friends'),
      mainImage: Image.asset(
        'assets/logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'Nunito', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabHome(),
                  ), //MaterialPageRoute
                );
              },
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), //IntroViewsFlutter
      ), //Builder
    ); //
  }
}
