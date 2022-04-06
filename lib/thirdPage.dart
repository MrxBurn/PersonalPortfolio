// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart';

import 'firstPage.dart';

import 'dart:math';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Variables
    var media = MediaQuery.of(context).size;
    String linkedin = 'https://www.linkedin.com/in/alexandru-todea-5b97891bb/';
    String facebook = 'https://www.facebook.com/todea.alex.75';
    String instagram = 'https://www.instagram.com/todea.alex18/';

    //Function that downloads my CV
    void downloadCV(location) {
      AnchorElement anchorElement = AnchorElement(href: location);
      anchorElement.download = "Alex Todea's CV";
      anchorElement.click();
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.gif'), fit: BoxFit.cover)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
              child: Align(
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
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                height:
                    media.width > 600 ? media.height * 0.5 : media.height * 0.7,
                width:
                    media.width > 600 ? media.width * 0.5 : media.width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.black.withOpacity(0.5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: media.width > 600 ? 60 : 40,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Email: alextodea14@yahoo.ro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: media.width > 600 ? 30 : 20,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => launch(linkedin),
                              icon: FaIcon(
                                FontAwesomeIcons.linkedin,
                                size: media.width > 600 ? 40 : 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () => launch(facebook),
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: media.width > 600 ? 40 : 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () => launch(instagram),
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                size: media.width > 600 ? 40 : 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 40, left: 20),
                          child: Text(
                            'Want to see my CV?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: media.width > 600 ? 30 : 20,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () => downloadCV('assets/cv.pdf'),
                            child: Text(
                              'Download CV',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: media.width > 600 ? 30 : 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ]),
              )),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Thanks for checking my portfolio :)',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: media.width > 600 ? 60 : 20),
            ),
          ))
        ],
      ),
    );
  }
}
