import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/color/constant.dart';

class TopicsButton extends StatelessWidget {
  const TopicsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(300, 300)),
        border: Border.all(color: secondbgcolor)
      ),
      child: const Center(
        child: Text('Topics', style: TextStyle(color: secondbgcolor, fontSize: 20),),
      ),
    );
  }
}