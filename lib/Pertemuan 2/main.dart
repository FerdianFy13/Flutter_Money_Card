import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  void answer1() => print('The answer is one.');
  void answer2() => print('The answer is second.');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text(' <= Ferdian Firmansyah =>'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ferdian Firmansyah'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       'Laravel 1',
            //       style: TextStyle(
            //         color: Colors.black,
            //         backgroundColor: Colors.yellow,
            //       ),
            //     ),
            //     Text(
            //       'Laravel 2',
            //       style: TextStyle(
            //         color: Colors.amber,
            //         backgroundColor: Colors.red,
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       'Laravel 3',
            //       style: TextStyle(
            //         color: Colors.white,
            //         backgroundColor: Colors.red,
            //       ),
            //     ),
            //     Text(
            //       'Laravel 4',
            //       style: TextStyle(
            //         color: Colors.black,
            //         backgroundColor: Colors.yellow,
            //       ),
            //     ),
            //   ],
            // ),
            Text('Exercise 1'),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: answer1,
              color: Colors.blue.shade300,
              child: Text('Answer 1'),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: answer2,
              color: Colors.green.shade400,
              child: Text('Answer 2'),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () => print('The answer is third'),
              color: Colors.red,
              child: Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
