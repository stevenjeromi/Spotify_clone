import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tiles extends StatelessWidget {
  List<String> something;
  Tiles({required this.something});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: GridView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 16 / 9),
          children: something.map((val) {
            return Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(val, fit: BoxFit.cover)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
