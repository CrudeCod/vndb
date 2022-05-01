
import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _LoginFields(),
          ],
        ),
      ),
    );
  }
}

class _LoginFields extends StatefulWidget {
  const _LoginFields({Key? key}) : super(key: key);

  @override
  State<_LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<_LoginFields> {
  final _loginTextController = TextEditingController(
  );
  final _passwordTextController = TextEditingController();
  final _loginFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  String errorText = '';

  void _auth(){
    if(_loginTextController.text == 'admin' && _passwordTextController.text == 'admin'){
      errorText = 'Logged in!';
      Navigator.of(context).pushReplacementNamed('/main_screen');
    }
    else {
      errorText = 'Wrong login or password!';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    errorText = this.errorText;
    final inputDecoration = InputDecoration(
      isCollapsed: true,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(7.0),
      ),
      focusColor: Colors.blue,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Login'),
        SizedBox(height: 15,),
        TextField(
          decoration: inputDecoration,
          obscureText: false,
          controller: _loginTextController,
          focusNode: _loginFocusNode,
          textInputAction: TextInputAction.next,

        ),
        SizedBox(height: 15,),
        Text('Password'),
        SizedBox(height: 15,),
        TextField(
          decoration: inputDecoration,
          obscureText: true,
          controller: _passwordTextController,
          focusNode: _passwordFocusNode,
          textInputAction: TextInputAction.done,
          onEditingComplete: _auth,
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            ElevatedButton(onPressed: _auth, child: Text('Login'),),
            SizedBox(width: 20,),
            TextButton(onPressed: () {}, child: Text('Reset password'),)
          ],
        ),
        Text(errorText),

      ],
    );
  }
}
