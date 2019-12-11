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
              height: 430.0,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: NetworkImage(widget.pic),
                fit: BoxFit.cover,
              )
            ),
            Container(
              child: Center(
                child: Text(widget.value, style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                  ),  
                ),
              ),
              color: Colors.black,
              height: 55.0,
              width: MediaQuery.of(context).size.width,              
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.mic, size: 60.0,),
                  onPressed: (){},
                  color: Color(0xFFaef879),
                  padding: const EdgeInsets.fromLTRB(70.0,15.0,75.0,20.0),
                ),
                RaisedButton(
                  child: Icon(Icons.message, size: 60.0,),
                  onPressed: (){},
                  color: Color(0xFF8acaf6),
                  padding: const EdgeInsets.fromLTRB(75.0,15.0,70.0,20.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}