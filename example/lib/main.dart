import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

void main() {
  runApp(MyApp());
}

class SpanishStrings implements FlutterPwValidatorStrings{

  @override
  String get atLeast => '- caracteres';

  @override
  String get numericCharacters => '- caracter numérico';

  @override
  String get specialCharacters => '- caracter especial';

  @override
  String get uppercaseLetters => '- mayúscula';
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Flutter Pw Validator"),
            ),
            body: new AppHome()));
  }
}

class AppHome extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
        child: Column(
          children: [
            new Flexible(flex: 5, child: new FlutterLogo(size: 200)),
            Flexible(
              flex: 7,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: new TextField(
                        controller: controller,
                        decoration: new InputDecoration(
                            hintText: "Password",
                            border: new OutlineInputBorder(
                                borderSide: BorderSide()))),
                  ),
                  new SizedBox(
                    height: 5,
                  ),
                  new FlutterPwValidator(
                    controller: controller,
                    minLength: 8,
                    uppercaseCharCount: 1,
                    numericCharCount: 1,
                    specialCharCount: 1,
                    regExpSpecialChar: r"[@#$%^&'*:;()+_=.,-]",
                    width: 400,
                    height: 150,
                    validationBar: true,
                    strings: SpanishStrings(),
                    onSuccess: () {
                      print("Matched");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
