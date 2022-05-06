import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:ui';

class CardWidget extends StatelessWidget {
  Novel novel;
  late String title = '';
  late String date = '';
  late String description = '';
  late String image = '';
  // ignore: use_key_in_widget_constructors
  CardWidget(
    this.novel, {
    Key? key,
  }) {
    title = novel.name;
    date = novel.date;
    description = novel.description;
    image = novel.image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(65),
            offset: Offset(0, 10),
            blurRadius: 20.0,
          )
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(0.7),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white54,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      description,
                      maxLines: 5,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print("card tapped");
            },
          ),
        ],
      ),
    );
  }
}

class Novel {
  final String name;
  final String date;
  final String description;
  final String image;

  Novel(
      {required this.name,
      required this.date,
      required this.description,
      required this.image});
}
