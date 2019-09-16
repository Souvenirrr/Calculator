import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String button){
    if(button == "Clear"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else if(button == "+" || button == "-" || button == "*" || button == "/"){
      num1 = double.parse(output);
      operand = button;
      _output = "0";
    }else if(button == "."){
      if(_output.contains(".")){
        print("Already contains a decimals");
        return;
      }else{
        _output = _output + button;
      }
    }else if(button == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else{
      _output = _output + button;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String button){
    return Expanded(
      child: RaisedButton(
        padding: EdgeInsets.all(24.0),
        color: Colors.grey,
        child: Text(button,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        onPressed: () => {
          buttonPressed(button),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 105.0,
                horizontal: 10.0,
              ),
              child: Text(
                output,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
//            Expanded(
//              child: Divider(color: Colors.lightBlueAccent,),
//            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("Clear"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("0"),
                    buildButton("."),
                    buildButton("="),
                    buildButton("+"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
