import 'package:flutter/material.dart';
import '../vn_search/vn_card_widget.dart';

class VNPageWidget extends StatelessWidget {
  final int id;
  VNPageWidget({
    Key? key,
    required this.id,
    //implement proper get name of novel by novels.where() etc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VN name'),
      ),
    );
  }
}
