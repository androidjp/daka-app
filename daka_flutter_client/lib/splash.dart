import 'dart:async';
import 'package:flutter/material.dart';
import 'package:daka_flutter_client/home.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<SplashPage> {

  Timer _t;


  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
            builder: (BuildContext context) => new DakaApp()), (
            Route route) => route == null);
      } catch (e) {

      }
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
//      color: new Color.fromARGB(255, 59, 92, 255),
      color: Colors.blue,
      child: new Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: new Column(
          children: <Widget>[
            new Text("叫你干活",
              style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    );
  }





}