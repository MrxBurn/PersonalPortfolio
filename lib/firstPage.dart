// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/thirdPage.dart';
import 'secondPage.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static PageController pageController = PageController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //Variables
    GlobalKey secondPageKey = GlobalKey();
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body:
            //First page column
            PageView(
      controller: HomePage.pageController,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Column(children: [
          Expanded(
              child: Stack(children: [
            const Image(
              image: AssetImage('assets/background.jpg'),
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: media.width > 600 ? 70 : 40),
                    ))),
            Padding(
                padding: EdgeInsets.only(
                  top: media.height * 0.5,
                ),
                child: Center(
                    child: Text(
                  "Software Developer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: media.width > 600 ? 30 : 20,
                  ),
                ))),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: Transform.rotate(
                    angle: 90 * pi / -180,
                    child: Pulse(
                        infinite: true,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ))),
                iconSize: 30,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  HomePage.pageController.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
              ),
            )
          ])),
        ]),
        Description(),
        Contact(),
      ],
    ));
  }
}
