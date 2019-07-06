import 'package:flutter/material.dart';
import 'package:mobcom_final_task/onboarding.dart';

void main() => runApp(MyApp());

// final routes = <String, WidgetBuilder>{
//   };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding()
      // title: 'Kodeversitas',
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      //   fontFamily: 'Nunito',
      // ),
      // home: LoginPage(),
      // routes: routes,
    );
  }
}
