import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getwidget/getwidget.dart';

class Tiles extends StatelessWidget {
  Tiles({super.key, required this.title, required this.shape});
  String title;
  GFAvatarShape shape;
  @override
  Widget build(BuildContext context) {
    return GFListTile(
      shadow: BoxShadow(blurRadius: 0),
      avatar: GFAvatar(
        radius: 30,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[900],
        shape: shape,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'LibreFranklin',
            color: Colors.white),
      ),
    );
  }
}
