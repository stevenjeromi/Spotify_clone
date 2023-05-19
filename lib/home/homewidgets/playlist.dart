import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify_clone/data.dart';

import '../../audio.dart';

class PlayLists extends StatelessWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 16 / 6),
        children: Data().playlist.map((val) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AudioPlayerPro(
                    audiourl: val['audio'].toString(),
                    name: val['name'].toString(),
                    image: val['image'].toString(),
                  );
                },
              ));
            },
            child: Card(
              color: Color.fromRGBO(49, 58, 55, 1),
              child: IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(val['image'].toString()))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    val['name'].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                ],
              )),
            ),
          );
        }).toList());
  }
}
