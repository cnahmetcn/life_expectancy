import 'package:flutter/material.dart';

import 'user_data.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Center(
                child: Text(
              'Tahmini Yaşam Süreniz: ' +
                  Hesap(_userData).hesaplama().round().toString() +
                  '\n' +
                  'Vücut Kitle Endeksiniz: ' +
                  Hesap(_userData).vki().toStringAsFixed(2),
              style: TextStyle(fontSize: 27, color: Colors.white),
            )),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  minimumSize: Size(550, 100),
                  textStyle: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
