import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify_clone/data.dart';
import 'package:spotify_clone/search/widgets/tiles.dart';

class TopGenere extends StatelessWidget {
  const TopGenere({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Your Top Genere',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Tiles(
          something: Data().genres,
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('Browse All',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'LibreFranklin',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Tiles(
          something: Data().browseall,
        ),
      ],
    );
  }
}
