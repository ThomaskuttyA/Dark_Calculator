import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(calculatordark());
}

class calculatordark extends StatelessWidget {
  const calculatordark({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calchome(),
    );
  }
}

class calchome extends StatefulWidget {
  const calchome({super.key});

  @override
  State<calchome> createState() => _calchomeState();
}

class _calchomeState extends State<calchome> {
  String equation = '0';
  String result = '0';
  String expression = '';

  buttonPresed(btnText) {
    setState(() {
      if (btnText == 'AC') {
        equation = '0';
        result = '0';
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == 'DEL') {
        equation = equation.substring(0, equation.length -1 );
        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == '=') {
        expression = equation;
        expression = expression.replaceAll('x', "*");
        expression = expression.replaceAll('÷', "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'Error';
        }
      } else {
        if (equation == '0') {
          equation = btnText;
        } else
          equation = equation + btnText;
      }
    });
  }

  Widget calcdarkswitch(
      String btnText, Color txtColor, double btnwidth, Color buttoncolor) {
    return InkWell(
      onTap: () {
        buttonPresed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: btnwidth,
        decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Text(
          btnText,
          style: TextStyle(
              color: txtColor, fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            height: 100,

            width: double.infinity,
            color: Colors.black,
            child: Text(
              equation,
              style: TextStyle(color: Colors.cyanAccent, fontSize: 33),
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            color: Colors.black,
            child: Text(
              result,
              style: TextStyle(color: Colors.cyanAccent, fontSize: 45),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Container(alignment: Alignment.center,



            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    calcdarkswitch('AC', Colors.black, 90, Colors.grey), SizedBox(width:4,),
                    calcdarkswitch('DEL', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                    calcdarkswitch('⌫', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                    calcdarkswitch('=', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcdarkswitch('1', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('2', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('3', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('x', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcdarkswitch('4', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('5', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('6', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('÷', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcdarkswitch('7', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('8', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('9', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('-', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcdarkswitch('.', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('0', Colors.black, 90, Colors.cyanAccent),SizedBox(width: 4,),
                    calcdarkswitch('00', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                    calcdarkswitch('+', Colors.black, 90, Colors.grey),SizedBox(width: 4,),
                  ],
                ),

              ],

            ),


          ),
        ],
      ),
    );
  }
}
