import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionindex = 0;

  void resetQuiz() {
    setState(() {
      _questionindex = 0;
    });
  }

  void _answerQuestion() {
    setState(() {
      _questionindex = _questionindex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List _questions = [
      {
        'questionText': 'What is your Favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 15},
          {'text': 'Green', 'score': 20},
          {'text': 'White', 'score': 25}
        ]
      },
      {
        'questionText': 'What is your Favourite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 10},
          {'text': 'Snake', 'score': 15},
          {'text': 'Elephant', 'score': 20},
          {'text': 'Lion', 'score': 25}
        ]
      },
      {
        'questionText': 'What is your Favourite Car?',
        'answers': [
          {'text': 'Tata Altroz', 'score': 10},
          {'text': 'Honda City', 'score': 15},
          {'text': 'Hyundai Verna', 'score': 20},
          {'text': 'Kia Sonet', 'score': 25}
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'QUIZ APP',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                wordSpacing: 5,
                textBaseline: TextBaseline.ideographic,
                height: 2.9,
                leadingDistribution: TextLeadingDistribution.even,
                decorationThickness: 2,
                overflow: TextOverflow.visible),
          ),
          backgroundColor: Colors.green,
          flexibleSpace: SafeArea(
            child: Icon(Icons.camera, color: Colors.white),
          ),
          bottom: PreferredSize(
            child: Container(
              height: 25,
              color: Colors.pink,
            ),
            preferredSize: Size.fromHeight(40),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.message)),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Arun',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                accountEmail: Text('arun20george@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('A'),
                  backgroundColor: Colors.amberAccent,
                ),
              ),
              ListTile(
                title: Text('Menu'),
                leading: Icon(Icons.menu),
              )
            ],
          ),
          backgroundColor: Colors.orange,
        ),
        persistentFooterButtons: [
          Container(
              width: 102,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.add_alert),
              )),
          Container(
            width: 102,
            child: ElevatedButton(onPressed: () {}, child: Icon(Icons.abc)),
          ),
          Container(
            width: 102,
            child: TextButton(onPressed: () {}, child: Text('BUTTON')),
          )
        ],
        body: Column(
          children: [
            _questionindex < _questions.length
                ? Quiz(
                    _questions,
                    _answerQuestion,
                    _questionindex,
                  )
                : Result(resetQuiz),
            TextField(
              decoration: InputDecoration(
                label: Text('Enter the text'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
