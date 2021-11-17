import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/Screens/movie_llist_page.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MovieScreen()),
              (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    //this.read();
    this.startTime();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor:Colors.black,
      body: new Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.blueAccent,
          child: new Container(
            child: Text('Movie App', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),),
          ),
        ),
      ),
    );
  }
}
