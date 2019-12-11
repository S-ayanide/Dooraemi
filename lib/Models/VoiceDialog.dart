import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

SpeechRecognition _speechRecognition;
bool isAvailable = false;
bool isListening = false;
String resultText = "";

initSpeechRecognizer(){
  _speechRecognition = SpeechRecognition();
  _speechRecognition.setAvailabilityHandler((bool result) => 
    isAvailable = result
  );
  _speechRecognition.setRecognitionStartedHandler(() => 
    isListening = true
  );
  _speechRecognition.setRecognitionResultHandler((String speech) => 
    resultText = speech
  );
  _speechRecognition.setRecognitionCompleteHandler(() => 
    isListening = false
  );
  _speechRecognition.activate().then((result) => 
    isAvailable = result
  );
}
createSpeechDialog(BuildContext context){
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
                height: 100.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.cancel),
                    mini: true,
                    backgroundColor: Colors.deepOrange,
                    onPressed: () {
                      if (isListening)
                        _speechRecognition.cancel().then((result){
                          isListening = result;
                          resultText ="";
                        });
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.mic),
                    onPressed: () {
                      if (isAvailable && !isListening)
                        _speechRecognition
                            .listen(locale: "en_US")
                            .then((result) => print('$result'));
                    },
                    backgroundColor: Colors.pink,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.stop),
                    mini: true,
                    backgroundColor: Colors.deepPurple,
                    onPressed: () {
                      if (isListening)
                        _speechRecognition.stop().then(
                          (result){
                            isListening = result;
                          }
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  color: Color(0xFFe3d586),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  resultText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  });
}