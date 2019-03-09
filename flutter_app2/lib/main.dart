import 'package:flutter/material.dart';
import 'package:flutter_app2/model/User.dart';
import 'package:flutter_app2/PlaceHolderWidget.dart';

void main() {
  runApp(new FriendlyChat());
}

class FriendlyChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp (
      title: "FriendlyChat",
      theme: ThemeData(fontFamily: 'ProductSans'),
      home: new LoginScreen(),
      routes: <String,WidgetBuilder> {
        '/dashboard': (BuildContext context) => new SuccessLoginScreen()
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State createState () => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  User user = new User.EmptyConstructor();
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
                  Image.asset('assets/icons/signIn.png'),
                  SizedBox(height: 20.0),
                  Text('MATERIAL LOGIN'),
                ],
              ),
              SizedBox(height: 40.0),
              TextField(
                controller: _username,
                onChanged: (text){
                  user.setUserName(text);
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
                  user.setPassword(text);
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
                    color: Colors.amber,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () => _handleSubmitted(user)
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


  void _handleSubmitted(User user) {
    if (user.isValidLogin()) {
      Navigator.of(context).pushNamed('/dashboard');
    }
  }
}

class SuccessLoginScreen extends StatefulWidget {
  @override
  State createState() => new SuccessLoginScreenState();
}

class SuccessLoginScreenState extends State<SuccessLoginScreen> {
  int _selectedIndex = 0;
   final _widgetOptions = [
    PlaceholderWidget("SATELLITE"),
    PlaceholderWidget("CALENDAR"),
    PlaceholderWidget("ACCOUNT"),
    PlaceholderWidget("ACCESSIBLE"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: _widgetOptions[_selectedIndex],
      appBar: new AppBar(
        title: Text('Second Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(icon: Icon(Icons.satellite), title: Text('Satellite')),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('Calendar')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text ('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.accessible_forward), title: Text('Accessible')),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
     _selectedIndex = index; 
    });
  }


}