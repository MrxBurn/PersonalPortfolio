// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'secondPage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    //Variables
    GlobalKey secondPageKey = GlobalKey();
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body:
            //First page column
            PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Column(children: [
          Expanded(
              child: Stack(children: [
            const Image(
              image: AssetImage('background.jpg'),
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
                padding: EdgeInsets.only(top: media.width * 0.05),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Hi, I'm Alex",
                      style: TextStyle(color: Colors.white, fontSize: 70),
                    ))),
            Padding(
                padding: EdgeInsets.only(
                  top: media.height * 0.5,
                ),
                child: const Center(
                    child: Text(
                  "Software Developer",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ))),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: const Icon(Icons.arrow_downward_rounded),
                iconSize: 100,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
              ),
            )
          ])),
        ]),
        Column(
          children: [
            Description(
              key: secondPageKey,
            )
          ],
        )
      ],
    ));
  }
}