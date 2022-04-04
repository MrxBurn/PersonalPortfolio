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
  List<String> images = ['background.jpg'];

  @override
  Widget build(BuildContext context) {
    //Variables
    var media = MediaQuery.of(context).size;

    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Pulse(
                      infinite: false,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
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
            width: media.width,
            height: media.width * 0.9,
            child: Expanded(
                child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: ((context, index) {
                      return Card(
                          child: Expanded(
                              child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 30, top: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  titles[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              )),
                          Row(
                            children: [
                              //Make rounded images
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      child: Image(
                                        image: AssetImage(images[0]),
                                        height: 400,
                                        width: 500,
                                        fit: BoxFit.fill,
                                      ))),
                              SizedBox(
                                height: 500,
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(titles[index]),
                                  Text(descriptions[index]),
                                ],
                              ))
                            ],
                          )
                        ],
                      )));
                    })))),
        Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              icon: Transform.rotate(
                  angle: 90 * pi / -180,
                  child: Pulse(
                      infinite: false,
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
            )),
      ],
    );
  }
}
