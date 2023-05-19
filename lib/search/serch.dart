import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify_clone/bottomnavigation.dart';
import 'package:spotify_clone/search/widgets/SearchWidget.dart';
import 'package:spotify_clone/search/widgets/topgener.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(1),
        backgroundColor: Color.fromRGBO(18, 18, 18, 80),
        body: Container(
          child: ListView(
            children: [
              Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'LibreFranklin',
                    fontWeight: FontWeight.bold),
              ),
              SearchWidget(),
              TopGenere(),
            ],
          ),
        ),
      ),
    );
  }
}
