import 'package:flutter/material.dart';
import 'package:vndb/rating_circle.dart';
import 'package:vndb/widgets/vn_search/search_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  var _navBarIndex = 0;

  void _onNavBarTap(int index) {
    _navBarIndex = index;
    setState(() {});
  }

  final List<Widget> widgetList = [
    RatingCircleWidget(),
    SearchWidget(),
    Text('My List')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: widgetList[_navBarIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My List',
          ),
        ],
        currentIndex: _navBarIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}
