import 'package:flutter/material.dart';
import 'package:vndb/widgets/vn_search/vn_card_widget.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List<Novel> novels = [
    Novel(
        id: 1,
        title: 'Subarashiki hibi',
        date: 'May 2010',
        description:
            'Subarashiki Hibi is a story told in seven chapters. The story follows a group of several Tokyo high school students mostly through July of 2012 and each chapter is told from the perspective of one of its five main characters. Because of the same timeframe coverage, certain events are overlapping from chapter to chapter but at the core of it all is a mystery revolving around the prophecy about the end of the world on July the 20th as well as the events that are following before the said date. The first part of the VN is used to make a setting for the said mysteries while the second part is about uncovering the truth behind them all.',
        image: 'images/sample.jpg'),
    Novel(
        id: 2,
        title: 'Steins Gate',
        date: 'May 2012',
        description: 'This is steins gate ',
        image: 'images/sg.jpg'),
    Novel(
        id: 3,
        title: 'Higurashi',
        date: 'May 2010',
        description:
            'Subarashiki Hibi is a story told in seven chapters. The story follows a group of several Tokyo high school students mostly through July of 2012 and each chapter is told from the perspective of one of its five main characters. Because of the same timeframe coverage, certain events are overlapping from chapter to chapter but at the core of it all is a mystery revolving around the prophecy about the end of the world on July the 20th as well as the events that are following before the said date. The first part of the VN is used to make a setting for the said mysteries while the second part is about uncovering the truth behind them all.',
        image: 'images/sg.jpg'),
    Novel(
        id: 3,
        title: 'Tsukihime',
        date: 'May 2010',
        description:
            'Subarashiki Hibi is a story told in seven chapters. The story follows a group of several Tokyo high school students mostly through July of 2012 and each chapter is told from the perspective of one of its five main characters. Because of the same timeframe coverage, certain events are overlapping from chapter to chapter but at the core of it all is a mystery revolving around the prophecy about the end of the world on July the 20th as well as the events that are following before the said date. The first part of the VN is used to make a setting for the said mysteries while the second part is about uncovering the truth behind them all.',
        image: 'images/sample.jpg'),
    Novel(
        id: 4,
        title: 'Umineko',
        date: 'May 2010',
        description:
            'Subarashiki Hibi is a story told in seven chapters. The story follows a group of several Tokyo high school students mostly through July of 2012 and each chapter is told from the perspective of one of its five main characters. Because of the same timeframe coverage, certain events are overlapping from chapter to chapter but at the core of it all is a mystery revolving around the prophecy about the end of the world on July the 20th as well as the events that are following before the said date. The first part of the VN is used to make a setting for the said mysteries while the second part is about uncovering the truth behind them all.',
        image: 'images/sg.jpg'),
  ];

  TextEditingController _searchController = TextEditingController();
  void initState() {
    _searchController.addListener(_search);
  }

  List<Novel> _filteredNovels = [];

  void _search() {
    var query = _searchController.text;
    if (query.isEmpty) {
      _filteredNovels = novels;
    }
    _filteredNovels = novels.where((element) {
      if (element.title.toLowerCase().contains(query.toLowerCase())) {
        return true;
      } else {
        return false;
      }
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          itemCount: _filteredNovels.length,
          itemExtent: 180,
          itemBuilder: (BuildContext context, int index) {
            final novel = _filteredNovels[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: CardWidget(novel),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(200),
              border: OutlineInputBorder(),
              hintText: 'Search',
            ),
            maxLines: 1,
            controller: _searchController,
          ),
        ),
      ],
    );
  }
}
