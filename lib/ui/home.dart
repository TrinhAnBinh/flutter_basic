import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BizCard'),
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),

    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(20),
      )
      ,child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Binh Trinh An',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text('Email: binhta1995@gmail.com'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person_add),
            Text('Facebook: BinhTrinh'),
          ],
        )
      ],
    ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(image: NetworkImage('https://picsum.photos/200/300')),
      ),
    );
  }
}


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
