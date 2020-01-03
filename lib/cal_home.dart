import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final textControllerInput = TextEditingController();
  final textControllerResult = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes
    textControllerInput.addListener(() {});
    textControllerResult.addListener(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    textControllerInput.dispose();
    textControllerResult.dispose();
    super.dispose();
  }

  dynamic text = '0';
  int num1 = 0;
  int num2 = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  Widget buttons(String buttonText, TextStyle textStyle) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: OutlineButton(
          borderSide: BorderSide.none,
          highlightedBorderColor: kColor2,
          highlightColor: kColor2,
          onPressed: () {
            calculation(buttonText);
            setState(() {
              textControllerInput.text = textControllerInput.text + buttonText;
            });
          },
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
      ),
    );
  }

  Widget operationButtons(String buttonText) {
    return Expanded(
      child: CircleAvatar(
        backgroundColor: Color(0xf5392F2F),
        radius: 25,
        child: FlatButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            calculation(buttonText);
            setState(() {
              textControllerInput.text = textControllerInput.text + buttonText;
            });
          },
          child: Text(
            buttonText,
            style: TextStyle(color: kColor4, fontSize: 30),
          ),
        ),
      ),
    );
  }

  Widget buttonIcon(IconData buttonIcon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: OutlineButton(
            borderSide: BorderSide.none,
            highlightedBorderColor: kColor2,
            highlightColor: kColor2,
            onPressed: () {},
            child: Icon(
              buttonIcon,
              size: 40,
              color: kColor4,
            )),
      ),
    );
  }

  Widget backButtonIcon(IconData buttonIcon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: OutlineButton(
            borderSide: BorderSide.none,
            highlightedBorderColor: kColor2,
            highlightColor: kColor2,
            onPressed: () {
              text =
                  (text.length > 0) ? (text.substring(0, text.length - 1)) : "";
            },
            child: Icon(
              buttonIcon,
              size: 40,
              color: kColor4,
            )),
      ),
    );
  }

//  String output = '0';
  double width = 30;
  Icon _icon = Icon(Icons.chevron_right);
  Color _color = kColor4;
  int _flex = 380;

//  buttonFunction(String buttonText) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          backgroundColor: kColor1,
          body: Stack(
            children: [
              AnimatedContainer(
                width: width,
                height: 365,
                decoration: BoxDecoration(color: kColor1, boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5, // has the effect of softening the shadow

                    offset: Offset(
                        1, // horizontal, move right
                        1 // vertical, move down
                        ),
                  ),
                ]),
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 20,
                        child: width == 200
                            ? Container(
                                child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
//                                      sideBarView(text),
                                      TextField(
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'Input',
                                            hintStyle:
                                                TextStyle(color: kColor4)),
                                        style: TextStyle(
                                            color: kColor4,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                        controller: textControllerInput,
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(FocusNode()),
                                      ),
                                      // Second TextField

                                      TextField(
                                        decoration: InputDecoration.collapsed(
                                            hintText: text,
                                            hintStyle:
                                                TextStyle(color: Colors.white)),
                                        textInputAction: TextInputAction.none,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                        textAlign: TextAlign.left,
                                        controller: textControllerResult,
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ))
                            : Container()),
                    Expanded(
                      flex: _flex,
                      child: IconButton(
                          icon: _icon,
                          color: _color,
                          onPressed: () {
                            setState(() {
                              width == 200 ? width = 30 : width = 200;
                              _icon = width == 200
                                  ? Icon(Icons.chevron_left)
                                  : Icon(Icons.chevron_right);
                              _flex = width == 200 ? 5 : 350;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100, right: 20),
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: '',
                              hintStyle: TextStyle(color: kColor4)),
                          style: TextStyle(
                              color: kColor4,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.right,
                          controller: textControllerInput,
                          onTap: () =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // To make a space in between and to push the contents down we do the following
                    Expanded(
                      child: Container(),
                    ),
                    // The above creates an expanded space in between the contents
                    Container(
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(color: kColor1, boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(4, 3),
                        )
                      ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              buttons(
                                  'C',
                                  kColoredStyle.copyWith(
                                      color: kColor4, fontSize: 50)),
                              buttonIcon(
                                FontAwesomeIcons.clone,
                              ),
                              buttons(
                                  '%',
                                  kColoredStyle.copyWith(
                                      color: kColor4, fontSize: 50)),
                              operationButtons('/')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              buttons('7', kColoredStyle),
                              buttons('8', kColoredStyle),
                              buttons('9', kColoredStyle),
                              operationButtons('x')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              buttons('4', kColoredStyle),
                              buttons('5', kColoredStyle),
                              buttons('6', kColoredStyle),
                              operationButtons('-')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              buttons('1', kColoredStyle),
                              buttons('2', kColoredStyle),
                              buttons('3', kColoredStyle),
                              operationButtons('+')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              buttons('.', kColoredStyle),
                              buttons('0', kColoredStyle),
                              backButtonIcon(Icons.backspace),
                              operationButtons('=')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculation(buttonText) {
    if (buttonText == 'C') {
      text = '0';
      num1 = 0;
      num2 = 0;

      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && preOpr == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = minus();
      } else if (preOpr == 'x') {
        finalResult = multiply();
      } else if (preOpr == '/') {
        finalResult = divide();
      }
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == 'x' ||
        buttonText == '=') {
      if (num1 == 0) {
        num1 = int.parse(result);
      }
      {
        num2 = int.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = minus();
      } else if (opr == 'x') {
        finalResult = multiply();
      } else if (opr == '/') {
        finalResult = divide();
      }
      preOpr = opr;
      opr = buttonText;
      result = '';
    } else {
      result = result + buttonText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (num1 + num2).toString();
    num1 = int.parse(result);
    return result;
  }

  String minus() {
    result = (num1 - num2).toString();
    num1 = int.parse(result);
    return result;
  }

  String multiply() {
    result = (num1 * num2).toString();
    num1 = int.parse(result);
    return result;
  }

  String divide() {
    result = (num1 ~/ num2).toString();
    num1 = int.parse(result);
    return result;
  }
}
