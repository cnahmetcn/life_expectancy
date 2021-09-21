import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'const.dart';
import 'gendericon.dart';
import 'mywidget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 170;
  int kilo = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            '$boy',
                            style: kMetinSitili,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            '170',
                            style: kSayiiSitili,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              minWidth: 20,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.blue),
                                ),
                                onPressed: () {
                                  print("object");
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 10,
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 36,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.blue),
                                ),
                                onPressed: () {
                                  print("object");
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada kaç kez spor yapıyorsunuz?',
                    style: kMetinSitili,
                  ),
                  Text('${yapilanSpor.round()}', style: kSayiiSitili),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: yapilanSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSpor = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Günde kaç adet sigara içiyorsunuz?',
                    style: kMetinSitili,
                  ),
                  Text('${icilenSigara.round()}', style: kSayiiSitili),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: GenderIcon(
                      gender: 'KADIN',
                      ikon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: GenderIcon(
                      gender: 'ERKEK',
                      ikon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
