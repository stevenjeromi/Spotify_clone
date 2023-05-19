import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 50,
      child: Row(children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Icon(
            Icons.search_sharp,
            size: 30,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'Artists songs or podcasts',
          style: TextStyle(
            color: Color.fromRGBO(83, 83, 83, 1),
            fontFamily: 'LibreFranklin',
            fontSize: 15,
          ),
          softWrap: true,
          overflow: TextOverflow.fade,
        )
      ]),
    );
  }
}
