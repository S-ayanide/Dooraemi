import 'package:flutter/material.dart';

final String voicemailOne = 'Sorry! Nobody is at home right now.';
final String voicemailTwo = 'Please, leave the parcel with the neighbour.';
final String voicemailThree = "Please wait a minute, we'll be right there";

createVoicemailDialog(BuildContext context){
  return showDialog(context: context, builder: (context){
    return Dialog(
      child: Container(
        color: Color(0xFFF5F5DC),
        height: 300.0,
        width: 350.0,
        child: Card(
          elevation: 15.0,
          color: Color(0xFFF5F5DC),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: 305.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.black,
                  onPressed: (){},
                  child: Text(voicemailOne, style: TextStyle(
                    color: Colors.white, 
                    fontSize: 14.0
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 305.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.black,
                  onPressed: (){},
                  child: Text(voicemailTwo, style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 305.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.black,
                  onPressed: (){},
                  child: Text(voicemailThree, style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}