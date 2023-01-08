import 'package:flutter/material.dart';

class ShareAndRate extends StatelessWidget {
  const ShareAndRate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/share.png',
                          scale: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/star.png',
                          scale: 70,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Rate Us',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}