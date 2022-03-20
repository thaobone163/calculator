//
// MSV: 19020445
// Họ tên: Bùi Thị Phương Thảo
//

import 'package:flutter/material.dart';
import 'package:calculator/math.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  Math math = Math();

  Widget btn(btnText, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
          child: Text(
            btnText,
            style: const TextStyle(fontSize: 30),
          ),
          onPressed: () {
            setState(() {
              //gọi hàm xử lí khi có action
              math.callBack(btnText);
            });
          },
          color: color,
          padding: const EdgeInsets.all(20.0),
          shape: const CircleBorder()),
    );
  }

  Widget btnZero(btnText, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 30),
        ),
        onPressed: () {
          setState(() {
            math.callBack(btnText);
          });
        },
        color: color,
        padding:
            const EdgeInsets.only(left: 83, top: 21, right: 83, bottom: 21),
        shape: const StadiumBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text(math.getHistory(),
                style: const TextStyle(fontSize: 50, color: Colors.white60),
                maxLines: 1),
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 20, right: 20),
          ),
          Container(
            child: Text(
              math.getExpression(),
              style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 20, right: 20),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //chia đều khoảng cách giữa có button
              children: [
                btn('C', Colors.white70),
                btn('+/-', Colors.white70),
                btn('%', Colors.white70),
                btn(':', Colors.orange)
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            btn('7', Colors.white),
            btn('8', Colors.white),
            btn('9', Colors.white),
            btn('x', Colors.orange)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            btn('4', Colors.white),
            btn('5', Colors.white),
            btn('6', Colors.white),
            btn('-', Colors.orange),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            btn('1', Colors.white),
            btn('2', Colors.white),
            btn('3', Colors.white),
            btn('+', Colors.orange),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            btnZero('0', Colors.white),
            btn('.', Colors.white),
            btn('=', Colors.orange)
          ])
        ],
      ),
    );
  }
}
