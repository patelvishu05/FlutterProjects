import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlyChat());
}

class FriendlyChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp (
      title: "FriendlyChat",
      home: new LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State createState () => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String user="";
  String pass="";
  final TextEditingController _username = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 110.0),
              Column(
                children: <Widget>[
                  Image.asset('assets/signIn.png'),
                  SizedBox(height: 20.0),
                  Text('MATERIAL LOGIN'),
                ],
              ),
              SizedBox(height: 40.0),
              TextField(
                controller: _username,
                onChanged: (text){
                  user = text;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _password,
                onChanged: (text){
                  pass = text;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                ),
                obscureText: true,
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () => _clickedCancelled()
                  ),
                  RaisedButton(
                    child: Text('NEXT'),
                    onPressed: () => _handleSubmitted(user,pass)
                  )
                ],
              )
            ],
          )
      ),
    );
  }

  void _clickedCancelled() {
    _username.clear();
    _password.clear();
  }


  void _handleSubmitted(String uName, String pWord) {

  }



}