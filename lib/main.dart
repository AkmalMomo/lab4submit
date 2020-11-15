import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final sound = AudioCache();
  var dice1 = 'assets/dice1.png';
  var dice2 = 'assets/dice1.png';
  dynamic diceRoll = [
    "assets/dice1.png",
    "assets/dice2.png",
    "assets/dice3.png",
    "assets/dice4.png",
    "assets/dice5.png",
    "assets/dice6.png"
  ];

  Random rand1;

  void rollRandom() {
    setState(() {
      int min = 0;
      int max = diceRoll.length - 1;
      rand1 = new Random();
      int r1 = min + rand1.nextInt(max - min);
      int r2 = min + rand1.nextInt(max - min);
      dice1 = diceRoll[r1].toString();
      dice2 = diceRoll[r2].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(onPhoneShake: () {
      sound.play('diceRoll.mp3');
      rollRandom();
    });
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/diceeLogo.png'),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(dice1),
                      Image.asset(dice2),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  RaisedButton(
                    onPressed: () {
                      sound.play('diceRoll.mp3');
                      rollRandom();
                    },
                    color: Colors.yellow,
                    child: Text(
                      'GAMBLE',
                      style:
                          GoogleFonts.abel(textStyle: TextStyle(fontSize: 32)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
