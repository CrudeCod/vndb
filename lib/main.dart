import 'package:flutter/material.dart';
import 'package:vndb/widgets/auth/login.dart';
import 'package:vndb/widgets/main_screen/main_screen.dart';
import 'package:vndb/widgets/vn_page/vn_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginWidget(),
      routes: {
        '/auth': (context) => LoginWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/vn_page': (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;
          if (argument == null || argument is! int) {
            return VNPageWidget(
              id: 0,
            );
          } else {
            return VNPageWidget(id: argument);
          }
        }
      },
    );
  }
}
