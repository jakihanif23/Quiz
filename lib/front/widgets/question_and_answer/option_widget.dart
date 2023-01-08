import 'package:flutter/material.dart';
import 'package:quiz/color/constant.dart';

class OptionsWidget extends StatelessWidget {
  final String options;
  const OptionsWidget(
      {super.key,
      required this.options,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: ListTile(
          title: Text(
            options,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
