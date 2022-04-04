// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:personal_portfolio/firstPage.dart';
import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'listviewContent.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  //Variables

  @override
  Widget build(BuildContext context) {
    //Variables
    var media = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
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
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                    )),
                Align(
                    alignment: Alignment.centerLeft,
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
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                    )),
              ],
            ),

            //
            //Lazy building the list using ListView.Builder
            //
            media.width > 600
                ? Expanded(
                    child: SizedBox(
                        width: media.width,
                        height: media.height,
                        child: Expanded(
                            child: ListView.builder(
                                itemCount: titles.length,
                                itemBuilder: ((context, index) {
                                  return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Expanded(
                                          child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30, top: 30),
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
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                          child: Image(
                                                            image: AssetImage(
                                                                images[index]),
                                                            height: 400,
                                                            width: 500,
                                                            fit: BoxFit.fill,
                                                          )))),

                                              Expanded(
                                                  child: Column(
                                                children: [
                                                  Text(
                                                    titles[index],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    descriptions[index],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          )
                                        ],
                                      )));
                                })))),
                  )
                : Expanded(
                    child: SizedBox(
                        width: media.width,
                        height: media.height,
                        child: Expanded(
                            child: ListView.builder(
                                itemCount: titles.length,
                                itemBuilder: ((context, index) {
                                  return ExpansionTile(
                                    initiallyExpanded: true,
                                    title: Text(titles[index]),
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 10,
                                                right: 10,
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: Image(
                                                    image: AssetImage(
                                                        images[index]),
                                                    height: 400,
                                                    width: 500,
                                                    fit: BoxFit.fill,
                                                  ))),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10,
                                              bottom: 10,
                                            ),
                                            child: Text(
                                              descriptions[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                })))))
          ],
        ))
      ],
    );
  }
}
