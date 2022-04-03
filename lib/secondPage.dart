// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:personal_portfolio/firstPage.dart';
import 'dart:math';
import 'package:animate_do/animate_do.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  //Variables
  List<String> titles = ['DSUK App', 'Cyber Training App'];
  List<String> descriptions = ['Durham Constabulary', 'Dissertation'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Pulse(
                      infinite: true,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white.withOpacity(0.3),
                      ))),
              iconSize: 30,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                HomePage.pageController.previousPage(
                    duration: Duration(seconds: 1), curve: Curves.easeInOut);
              },
            )),
        SizedBox(
            width: 400,
            height: 600,
            child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(titles[index]),
                    subtitle: Text(descriptions[index]),
                  );
                })))
      ],
    );
  }
}
