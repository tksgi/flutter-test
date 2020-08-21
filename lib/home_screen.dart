import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('トップページ'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text('ゲーム'),
            onPressed: () => Navigator.pushNamed(
              context,
              '/othello',
            ),
          ),
        ],
      ),
    );
  }
}
