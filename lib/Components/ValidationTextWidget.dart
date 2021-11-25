import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Utilities/SizeConfig.dart';

/// ValidationTextWidget that represent style of each one of them and shows as list of condition that you want to the app user
class ValidationTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final int? value;
  final Color? textColor;

  ValidationTextWidget(
      {required this.color, required this.text, required this.value, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Container(
          width: SizeConfig.width! * 0.03,
          height: SizeConfig.width! * 0.03,
          child: new CircleAvatar(
            child: Icon(Icons.check, color: Colors.black, size: 14,),
            backgroundColor: color,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.width! * 0.03),
          child: new Text(
            text.replaceFirst("-", value.toString()),
            style:
                new TextStyle(fontSize: SizeConfig.width! * 0.04, color: textColor),
          ),
        )
      ],
    );
  }
}
