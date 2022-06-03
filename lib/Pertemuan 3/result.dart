import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  final Function restartHandler;
  int score;
  Result(this.score, this.restartHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              'Quiz is Over',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'Your score is ' + score.toString(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            // ignore: deprecated_member_use
            Container(
              margin: EdgeInsets.only(top: 15),
              // ignore: deprecated_member_use
              child: RaisedButton(
                autofocus: false,
                color: Colors.orange.shade800,
                clipBehavior: Clip.antiAlias,
                onPressed: restartHandler,
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Image.network(
              'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/01/22/2584848191.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
