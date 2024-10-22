import 'package:calc1/dark.dart';
import 'package:flutter/material.dart';

class bright extends StatelessWidget {
  late int a = 0, b = 0;
  String sym = '';
  TextEditingController _controller = TextEditingController();
  TextEditingController _displaytext = TextEditingController();
  late String disp = "";

  void dis(String x) {
    if (RegExp(r'^[0-9]$').hasMatch(x)) {
      _controller.text += x;
      _displaytext.text += x;

      int digit = int.parse(x);
      if (sym == '') {
        a = a * 10 + digit;
      } else {
        b = b * 10 + digit;
      }
    } else {
      sym = x;
      _displaytext.text += ' $x ';
      _controller.clear();
    }
  }

  void func() {
    int temp = 0;
    switch (sym) {
      case '+':
        temp = a + b;
        break;
      case '-':
        temp = a - b;
        break;
      case 'x':
        temp = a * b;
        break;
      case '/':
        temp = a ~/ b;
        break;
      case '%':
        temp = a % b;
        break;
    }
    _controller.text = temp.toString();
    a = temp;
    b = 0;
    sym = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'assets/moon.png',
              height: 20,
              width: 20,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => second()));
            }),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: _displaytext,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: const Color.fromARGB(221, 114, 112, 112),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: InputDecoration(border: InputBorder.none),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        whitebutton('%'),
                        SizedBox(height: 10),
                        greybutton('7'),
                        SizedBox(height: 10),
                        greybutton('4'),
                        SizedBox(height: 10),
                        greybutton('1'),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            _controller.clear();
                            _displaytext.clear();
                            a = 0;
                            b = 0;
                            sym = '';
                          },
                          child: Text(
                            'AC',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          style: TextButton.styleFrom(
                              minimumSize: Size(75, 75),
                              backgroundColor: Color(0xff505050),
                              foregroundColor: Colors.white),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        whitebutton('x'),
                        SizedBox(height: 10),
                        greybutton('8'),
                        SizedBox(height: 10),
                        greybutton('5'),
                        SizedBox(height: 10),
                        greybutton('2'),
                        SizedBox(height: 10),
                        greybutton('0'),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        whitebutton('/'),
                        SizedBox(height: 10),
                        greybutton('9'),
                        SizedBox(height: 10),
                        greybutton('6'),
                        SizedBox(height: 10),
                        greybutton('3'),
                        SizedBox(height: 10),
                        greybutton('.'),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        orangebutton('c'),
                        SizedBox(height: 10),
                        orangebutton('-'),
                        SizedBox(height: 10),
                        orangebutton('+'),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            func();
                          },
                          child: Text(
                            '=',
                            style: TextStyle(fontSize: 30),
                          ),
                          style: TextButton.styleFrom(
                              minimumSize: Size(75, 175),
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white),
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextButton greybutton(String x) {
    return TextButton(
      onPressed: () {
        dis(x);
      },
      child: Text(
        x,
        style: TextStyle(
            fontSize: 25, fontFamily: 'poppins', fontWeight: FontWeight.w500),
      ),
      style: TextButton.styleFrom(
          minimumSize: Size(75, 75),
          backgroundColor: Color(0xff505050),
          foregroundColor: Colors.white),
    );
  }

  TextButton whitebutton(String x) {
    return TextButton(
      onPressed: () {
        dis(x);
      },
      child: Text(
        x,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'poppins',
        ),
      ),
      style: TextButton.styleFrom(
          shape: CircleBorder(),
          minimumSize: Size(75, 75),
          backgroundColor: Color(0xffd4d4d2),
          foregroundColor: Colors.white),
    );
  }

  TextButton orangebutton(String x) {
    return TextButton(
      onPressed: () {
        dis(x);
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          x,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'poppins-light',
          ),
        ),
      ),
      style: TextButton.styleFrom(
        minimumSize:
            Size(75, 75), // Ensures the button is large enough to be circular
        shape: CircleBorder(),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }
}
