import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  final String value;
  final String pic;
  Profile({this.value, this.pic});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 450.0,
              width: 500.0,
              child: Image(
                image: NetworkImage(widget.pic),
                fit: BoxFit.cover,
              )
            ),
          ],
        ),
      ),
    );
  }
}