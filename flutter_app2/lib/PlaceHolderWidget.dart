import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
 final String navBarName;

 PlaceholderWidget(this.navBarName);

  @override
  Widget build(BuildContext context) {
    return navBar(this.navBarName);
  }

  Container navBar(String navBarItem) {
    Container something;
    String output="";
    switch(navBarItem) 
    {
      case 'SATELLITE' : output = navBarItem;
        break;
      case 'CALENDAR' : output = navBarItem;
        break;
      case 'ACCOUNT' : output = navBarItem;
        break;
      case 'ACCESSIBLE' : output = navBarItem;
        break;

    }
    something = new Container(
      child: RaisedButton(
        child: Text(output),
        color: Colors.amber,
        onPressed: () => {},
      ),
      alignment: Alignment(0, 0),
    );
    return something;
  }
}