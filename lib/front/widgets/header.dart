import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/color/constant.dart';

class HeaderAndBackButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap_;
  const HeaderAndBackButton({super.key, required this.title, required this.onTap_});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          InkWell(
            onTap: onTap_,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: neutral,
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  color: neutral,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
