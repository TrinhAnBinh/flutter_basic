import 'package:first_flutter_app/model/question.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  // const MovieListView({Key? key}) : super(key: key);
  // List of movie
  final List movies = [
    "a",
    "b",
    "c",
    "c",
    "c",
    "c",
    "c",
    "c",
    "c",
    "c",
    "c",
    "c",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    child: Text('B'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                trailing: Text('...'),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MovieListViewDetails(movieName: movies.elementAt(index),)))

                },
                onLongPress: () => debugPrint('onLongPress ${movies[index]}'),
                title: Text(movies[index]),
                subtitle: Text('sub'),
              ),
            );
          }),
    );
  }
}

// New route , pages
class MovieListViewDetails extends StatelessWidget {
  final String movieName;

  const MovieListViewDetails({super.key, required this.movieName});
  // const MovieListViewDetails({Key? key, String .movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
            onPressed: () => {
              Navigator.pop(context)
            },
            icon: Icon(Icons.wb_cloudy, size: 20, color: Colors.white),
            label: Text(
              'Go back to the ${this.movieName}' + ' now',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  List listQuestion = [
    Question.name('Binh có đẹp trai không?', true),
    Question.name('Binh có đẹp gái không?', false),
    Question.name('Binh có đẹp giàu không?', false),
    Question.name('Binh có đẹp nhiều gái theo không?', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True Citizen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image.asset(
              'images/flag.png',
              width: 250,
              height: 180,
            )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    )),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${listQuestion[_questionIndex].questionText}',
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
                  ),
                )),
                height: 120,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  child: Text('True'),
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  child: Text('False'),
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                ),
                ElevatedButton(
                  onPressed: () => _nextQuestion(),
                  child: Icon(Icons.arrow_forward_ios),
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool valueChoice) {
    if (valueChoice == listQuestion[_questionIndex].isCorrect) {
      debugPrint('yes');
      final snackBar = SnackBar(
        backgroundColor: Colors.green.shade700,
        content: Text('Correct'),
        duration: Duration(microseconds: 500000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // next question auto
      _nextQuestion();
    } else {
      debugPrint('false');
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent.shade400,
        content: Text('Incorrect'),
        duration: Duration(microseconds: 500000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _nextQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % listQuestion.length;
    });
  }
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0.0;
  Color _purple = HexColor('#6908D6');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Per Person',
                      style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$ ${calculateTotalPerson(_tipPercentage, _billAmount, _personCounter)}',
                        style: TextStyle(color: _purple.withOpacity(0.5), fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              // height: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: _purple.withOpacity(0.1), //Colors.greenAccent.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12)),

              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple.withOpacity(0.5)),
                    decoration: InputDecoration(
                      prefixText: 'Bill Amount ',
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: _purple,
                      ),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Split',
                        style: TextStyle(color: _purple),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  // do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '$_personCounter',
                            style: TextStyle(
                              color: _purple.withOpacity(0.7),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: _purple.withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tip',
                        style: TextStyle(color: _purple, fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '\$ ${(calculateTotolTip(_billAmount, _tipPercentage)).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '$_tipPercentage%',
                        style: TextStyle(
                          color: _purple,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                          value: _tipPercentage.toDouble(),
                          min: 0,
                          max: 100,
                          divisions: 10,
                          inactiveColor: Colors.grey.shade400,
                          activeColor: _purple.withOpacity(0.7),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotolTip(double billAmount, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0.0 || billAmount.toString().isEmpty || billAmount == null) {
      // no go
    } else {
      totalTip = tipPercentage / 100 * billAmount;
    }
    return totalTip;
  }

  calculateTotalPerson(int tipPercentage, double billAmount, int splitBy) {
    double totalPerPerson = (calculateTotolTip(billAmount, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }
}

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  var _index = 0;
  List quote = [
    "When you reach the end of your rope, tie a knot in it and hang on. -Franklin D. Roosevelt",
    "When you reach the end of your rope, tie a knot in it and hang on. -Franklin D. Roosevelt",
    "Always remember that you are absolutely unique. Just like everyone else. -Margaret Mead",
    "Don't judge each day by the harvest you reap but by the seeds that you plant. -Robert Louis Stevenson",
    "The future belongs to those who believe in the beauty of their dreams. -Eleanor Roosevelt",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    quote[_index % quote.length],
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade600,
                    ),
                  )),
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
                onPressed: _showQuote,
                icon: Icon(Icons.wb_cloudy, size: 20, color: Colors.white),
                label: Text(
                  'Insprire me',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}

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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Binh Trinh An',
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.safety_check), label: 'First'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp), label: 'Second'),
          BottomNavigationBarItem(icon: Icon(Icons.back_hand), label: 'backHand'),
        ],
        onTap: (int index) {
          debugPrint('hehe $index');
        },
      ),
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
        child: Text(
          'Button',
        ),
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
