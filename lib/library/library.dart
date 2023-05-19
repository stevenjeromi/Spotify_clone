import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify_clone/bottomnavigation.dart';
import 'package:spotify_clone/data.dart';
import 'package:spotify_clone/library/widgets/header.dart';
import 'package:spotify_clone/library/widgets/roundedcards.dart';
import 'package:spotify_clone/library/widgets/tiles.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      bottomNavigationBar: BottomBar(2),
      body: ListView(
        children: [
          header(),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              roundedcards(text: 'playlist'),
              SizedBox(
                width: 10,
              ),
              roundedcards(text: 'Artists'),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.compare_arrows_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Recently Played',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LibreFranklin'),
                    )
                  ],
                ),
                Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          ...Data().library.map((val) {
            return GFListTile(
              shadow: BoxShadow(blurRadius: 0),
              avatar: GFAvatar(
                backgroundImage: AssetImage(val['image'].toString()),
                radius: 30,
                shape: val['shape'] as dynamic,
              ),
              title: Text(
                val['name'].toString(),
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subTitle: Text(
                val['subtitle'].toString(),
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(167, 167, 167, 1),
                    fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
          Tiles(title: 'Add Artists', shape: GFAvatarShape.circle),
          Tiles(title: 'Add Podcasts and shows', shape: GFAvatarShape.square),
        ],
      ),
    );
  }
}
