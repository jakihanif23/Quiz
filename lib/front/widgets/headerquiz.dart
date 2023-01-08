import 'package:flutter/material.dart';

class HeaderQuizPage extends StatelessWidget {
  final String title;
  final VoidCallback onTap_;
  const HeaderQuizPage({super.key, required this.title, required this.onTap_});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          InkWell(
            onTap: onTap_,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              right: 0,
              child: InkWell(
                onTap: onTap_,
                child: SizedBox(
                  height: 25,
                  width: 50,
                  child: Center(
                    child: Text(
                      'Exit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
