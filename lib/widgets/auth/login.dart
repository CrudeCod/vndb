import 'package:flutter/material.dart';

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
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _auth(){
    if(_loginTextController.text == 'admin' && _passwordTextController.text == 'admin'){
      print('Successfully logged in');
    }else{
      print('Wrong login or password!');
    }
  }
  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      isCollapsed: true,
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusColor: Colors.blue,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Login'),
        SizedBox(height: 10,),
        TextField(decoration: inputDecoration,obscureText: false, controller: _loginTextController,),
        SizedBox(height: 10,),
        Text('Password'),
        TextField(decoration: inputDecoration,obscureText: true, controller: _passwordTextController,),
        SizedBox(height: 10,),
        Row(
          children: [
            ElevatedButton(onPressed: _auth, child: Text('Login'),),
            SizedBox(width: 20,),
            TextButton(onPressed: () {}, child: Text('Reset password'),)
          ],
        ),
      ],
    );
  }
}
