import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
 final Color color;

 PlaceholderWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
    alignment: Alignment(0,0),
     child: RaisedButton(
       child: Text('NEXT'),
        color: this.color,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () => {}
     ),
   );
 }
}