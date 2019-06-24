import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class OnBoarding extends StatefulWidget{
  final String title;
  OnBoarding({this.title});
  @override
  OnBoardingState createState(){
    return new OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding>{
  int _slideIndex = 0;

  final List<String> images = [
    "assets/tourlima.png",
    "assets/tourempat.png"
  ];

  final List<String> text1 = [
    "Welcome",
    "Enjoy"
  ];

  final IndexController controller = IndexController();

@override
      Widget build(BuildContext context) {

        TransformerPageView transformerPageView = TransformerPageView(
            pageSnapping: true,
            onPageChanged: (index) {
              setState(() {
                this._slideIndex = index;
              });
            },
            loop: false,
            controller: controller,
            transformer: new PageTransformerBuilder(
                builder: (Widget child, TransformInfo info) {
              return new Material(
                color: Colors.white,
                elevation: 8.0,
                textStyle: new TextStyle(color: Colors.white),
                borderRadius: new BorderRadius.circular(12.0),
                child: new Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new ParallaxContainer(
                          child: new Text(
                            text1[info.index],
                            style: new TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 34.0,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                          position: info.position,
                          opacityFactor: .8,
                          translationFactor: 400.0,
                        ),
                        SizedBox(
                          height: 45.0,
                        ),
                        new ParallaxContainer(
                          child: new Image.asset(
                            images[info.index],
                            fit: BoxFit.contain,
                            height: 350,
                          ),
                          position: info.position,
                          translationFactor: 400.0,
                        ),
                        SizedBox(
                          height: 45.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            itemCount: 2);

        return Scaffold(
          backgroundColor: Colors.white,
          body: transformerPageView,
        );
}}