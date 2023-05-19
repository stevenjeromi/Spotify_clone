import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify_clone/data.dart';

import '../../audio.dart';

class recent extends StatelessWidget {
  const recent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            child: Text(
              'Recently Played',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'LibreFranklin',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: 210,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Data().recentlyplayed.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Column(
                    crossAxisAlignment: Data().recentlyplayed[index]
                        ['alignment'] as CrossAxisAlignment,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AudioPlayerPro(
                                audiourl: Data()
                                    .recentlyplayed[index]['audio']
                                    .toString(),
                                name: Data()
                                    .recentlyplayed[index]['name']
                                    .toString(),
                                image: Data()
                                    .recentlyplayed[index]['image']
                                    .toString(),
                              );
                            },
                          ));
                        },
                        child: Container(
                            child: GFAvatar(
                          shape: Data().recentlyplayed[index]['shape']
                              as GFAvatarShape,
                          backgroundImage: AssetImage(
                              Data().recentlyplayed[index]['image'].toString()),
                          radius: 70,
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          Data().recentlyplayed[index]['name'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
