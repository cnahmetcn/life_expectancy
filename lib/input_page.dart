import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam/results.dart';
import 'package:yasam/user_data.dart';

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
                    child: buildColumnOutlineButton(
                      'Boy',
                      '$boy',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildColumnOutlineButton(
                      'Kilo',
                      '$kilo',
                    ),
                  ),
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                            kilo: kilo,
                            boy: boy,
                            seciliCinsiyet: seciliCinsiyet,
                            icilenSigara: icilenSigara,
                            yapilanSpor: yapilanSpor,
                          ))));
            },
            child: Text('HESAPLA'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              minimumSize: Size(50, 50),
              textStyle: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnOutlineButton(String titleText, String valueText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: kMetinSitili,
        ),
        Text(
          titleText == 'Boy' ? boy.toString() : kilo.toString(),
          style: kSayiiSitili,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 20,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    titleText == 'Boy' ? boy++ : kilo++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    titleText == 'Boy' ? boy-- : kilo--;
                  });
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
    );
  }
}
