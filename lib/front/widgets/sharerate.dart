import 'package:flutter/material.dart';

class ShareAndRate extends StatelessWidget {
  final VoidCallback shareTap;
  final VoidCallback rateTap;
  const ShareAndRate({super.key, required this.shareTap, required this.rateTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: shareTap,
                    child: SizedBox(
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
                  ),
                  InkWell(
                    onTap: rateTap,
                    child: SizedBox(
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
                  ),
                ],
              ),
            );
  }
}