import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int first, second;
  String opp;
  String result, text = "";
  void btnClicked(String btnText){
    if (btnText == "C") {
      print("case1");
      //Очистка всех данных
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" || btnText == "-" || btnText == "×" || btnText == "÷") {
      print("case2");
      first = int.parse(text);
      result = "";
      opp = btnText;
    } else if (btnText == "=") {
      print("case3");
      second = int.parse(text);
      if(opp == "+"){
        result = (first + second).toString();
      } else if(opp == "-"){
        result = (first - second).toString();
      } else if(opp == "×"){
        result = (first * second).toString();
      } else if(opp == "÷"){
        result = (first ~/ second).toString();
      } else if(opp == "÷"){
        result = (first ~/ second).toString();
      } 
    } else {
      print("case4");
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customOutlineButton(String value, {Color color}) {
    return Expanded (
      child: Container(
        color: color,
        child: OutlineButton(
          onPressed: () => btnClicked(value),
          padding: EdgeInsets.all(25),
          child: Text(
            value,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.black87,
                  padding: EdgeInsets.all(25),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w200,
                      color: Colors.white
                    ),
                  ),
                )
            ),
            Row(
              children: [
                customOutlineButton("C", color: Colors.black54),
                customOutlineButton("±", color: Colors.black54),
                customOutlineButton("%", color: Colors.black54),
                customOutlineButton("÷", color: Colors.orange[600]),
              ],
            ),
            Row(
              children: [
                customOutlineButton("7", color: Colors.black54),
                customOutlineButton("8", color: Colors.black54),
                customOutlineButton("9", color: Colors.black54),
                customOutlineButton("×", color: Colors.orange[600]),
              ],
            ),
            Row(
              children: [
                customOutlineButton("4", color: Colors.black54),
                customOutlineButton("5", color: Colors.black54),
                customOutlineButton("6", color: Colors.black54),
                customOutlineButton("-", color: Colors.orange[600]),
              ],
            ),
            Row(
              children: [
                customOutlineButton("1", color: Colors.black54),
                customOutlineButton("2", color: Colors.black54),
                customOutlineButton("3", color: Colors.black54),
                customOutlineButton("+", color: Colors.orange[600]),
              ],
            ),
            Row(
              children: [
                customOutlineButton("0", color: Colors.black54),
                customOutlineButton(".", color: Colors.black54),
                customOutlineButton("=", color: Colors.orange[600]),
              ],
            )
          ],
        ),
      ),
    );
  }
}