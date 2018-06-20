import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gallery Demo",
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatelessWidget
{
  final List<String> images = [
    "assets/banana_creampie.jpg",
    "assets/cake.jpg",
    "assets/ice_cream.jpg",
    "assets/whipped_cream.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox.fromSize(
          size: Size.fromHeight(650.0),
          child: PageView.builder(
            //FRACTION
            controller: PageController(viewportFraction: 0.85),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 7.0
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(4.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              Color(0x00000000).withOpacity(0.7),
                              Color(0xff000000).withOpacity(0.1),
                            ]
                          )
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

