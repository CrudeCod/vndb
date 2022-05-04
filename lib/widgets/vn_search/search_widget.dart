import 'package:flutter/material.dart';
import 'package:vndb/widgets/vn_search/vn_card_widget.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);
  List<Novel> novels = [
    Novel(
        name: 'Subarashiki hibi',
        date: 'May 2010',
        description:
            'Subarashiki Hibi is a story told in seven chapters. The story follows a group of several Tokyo high school students mostly through July of 2012 and each chapter is told from the perspective of one of its five main characters. Because of the same timeframe coverage, certain events are overlapping from chapter to chapter but at the core of it all is a mystery revolving around the prophecy about the end of the world on July the 20th as well as the events that are following before the said date. The first part of the VN is used to make a setting for the said mysteries while the second part is about uncovering the truth behind them all.',
        image: 'images/sample.jpg'),
    Novel(
        name: 'Steins Gate',
        date: 'May 2012',
        description: 'This is steins gate ',
        image: 'images/sg.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: novels.length,
      itemExtent: 180,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: CardWidget(novels[index]),
        );
      },
    );
  }
}
