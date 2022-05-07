import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:ui';

class CardWidget extends StatefulWidget {
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
    title = novel.title;
    date = novel.date;
    description = novel.description;
    image = novel.image;
  }

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _onNovelCardClick(int id) {
    Navigator.of(context).pushNamed('/main_screen/vn_page', arguments: id);
    setState(() {});
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
            widget.image,
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
                      widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white54,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
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
            onTap: () => _onNovelCardClick(widget.novel.id),
          ),
        ],
      ),
    );
  }
}

class Novel {
  final String title;
  final String date;
  final String description;
  final String image;
  final int id;
  Novel(
      {required this.id,
      required this.title,
      required this.date,
      required this.description,
      required this.image});
}
