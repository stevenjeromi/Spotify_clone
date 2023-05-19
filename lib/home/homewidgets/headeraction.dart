import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 120,
        ),
        Icon(
          Icons.history,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 25,
        ),
        Icon(
          FontAwesomeIcons.gear,
          color: Colors.white,
          size: 25,
        )
      ],
    );
  }
}
