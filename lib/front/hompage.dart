import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/color/constant.dart';
import 'package:quiz/front/topicspage.dart';
import 'package:quiz/front/widgets/playbutton.dart';
import 'package:quiz/front/widgets/sharerate.dart';
import 'package:quiz/front/widgets/topicsbutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/lightbulb.png',
              width: 200,
            ),
            const Text(
              'Flutter Quiz App',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Learn • Take Quiz • Repeat',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(onTap: () {}, child: PlayButton()),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Topics())));
                },
                child: TopicsButton()),
            SizedBox(
              height: 30,
            ),
            ShareAndRate()
          ],
        ),
      ),
    );
  }
}
