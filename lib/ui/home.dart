import 'package:flutter/material.dart';

class ScaffordExample extends StatelessWidget {
  const ScaffordExample({Key? key}) : super(key: key);

  _tapIcon() {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('floatingActionButton ok ok');
        },
        backgroundColor: Colors.red.shade200,
        child: Icon(Icons.call_merge),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.safety_check),label: 'First'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp),label: 'Second' ),
        BottomNavigationBarItem(icon: Icon(Icons.back_hand), label: 'backHand'),
      ],
      onTap: (int index) {
        debugPrint('hehe $index');
      },),
      backgroundColor: Colors.cyanAccent.shade400,
      body: Container(
        // child: Text('Hello body'),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(),
            // InkWell(
            //   child: Text(
            //     'Tap me!',
            //     style: TextStyle(fontSize: 24),
            //   ),
            //   onTap: () => debugPrint('Tappp me'),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text('Hello Again'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // ScaffoldMesssenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('Button',),
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
