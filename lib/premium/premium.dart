import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify_clone/bottomnavigation.dart';
import 'package:spotify_clone/premium/widget/buttons.dart';
import 'package:spotify_clone/premium/widget/card.dart';
import 'package:spotify_clone/premium/widget/currentplan.dart';
import 'package:spotify_clone/premium/widget/premiumplan.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 50),
        bottomNavigationBar: BottomBar(3),
        body: ListView(children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Get 9 months of \n Premium for  \$500 ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'LibreFranklin',
              fontSize: 30,
            ),
          ),
          Cards(),
          Buttons(text: 'GET PREMIUM'),
          SizedBox(
            height: 10,
          ),
          const Text(
            'Terms and conditions apply. Open only to users who aren\'t subscribed to a recurring Premium plan and who haven\'t purchased a 12-month one-time Premium plan at a promotional price. Offer ends 8/15/21.',
            style: TextStyle(
                color: Color.fromRGBO(184, 184, 184, 10),
                fontSize: 12,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          CurrentPlan(),
          PremiumPlan(),
        ]),
      ),
    );
  }
}
