
import 'package:flutter/material.dart';


class ScaffordExample extends StatelessWidget {
  const ScaffordExample({Key? key}) : super(key: key);
  _tapIcon () {
    debugPrint('alam tapped');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scafford'),
        centerTitle: true,
        backgroundColor: Colors.brown.shade300,
        actions: <Widget>[
          IconButton(onPressed: () => debugPrint('Email tapped!!!'), icon: Icon(Icons.email)),
          IconButton(onPressed: _tapIcon, icon: Icon(Icons.access_alarm))
        ],
      ),
      body: Center(
        child: Text('Hello body'),

      ),
    );
  }
}



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepOrange,
        child: Center(
          child: Text(
            'Hello Flutter hehe hahah',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
        ));
  }
}
