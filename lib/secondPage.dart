// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:personal_portfolio/firstPage.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello Page 2'),
        IconButton(
            onPressed: () {
              HomePage.pageController.previousPage(
                  duration: Duration(seconds: 1), curve: Curves.easeInOut);
            },
            icon: Icon(Icons.arrow_upward_rounded))
      ],
    );
  }
}
