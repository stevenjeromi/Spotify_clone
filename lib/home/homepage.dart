import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify_clone/bottomnavigation.dart';
import 'package:spotify_clone/home/homewidgets/headeraction.dart';
import 'package:spotify_clone/home/homewidgets/jumpin.dart';
import 'package:spotify_clone/home/homewidgets/playlist.dart';
import 'package:spotify_clone/home/homewidgets/recent.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(0),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(57, 90, 81, 1),
            Color.fromRGBO(46, 71, 65, 1),
            Color.fromRGBO(43, 64, 59, 1),
            Color.fromRGBO(18, 18, 18, 1),
          ], stops: [
            0.01,
            0.03,
            0.06,
            0.2
          ])),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Good evening',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LibreFranklin'),
                    ),
                  ),
                  HeaderActions(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 210,
                child: PlayLists(),
              ),
              const SizedBox(
                height: 10,
              ),
              recent(),
              JumpIn(),
            ],
          ),
        ));
  }
}
