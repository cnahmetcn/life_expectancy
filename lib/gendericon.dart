import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderIcon extends StatelessWidget {
  final IconData ikon;
  final String gender;

  GenderIcon({
    this.ikon = FontAwesomeIcons.android,
    this.gender = 'Belirtilmedi',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ikon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(gender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
