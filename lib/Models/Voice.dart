import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class Voice extends StatefulWidget {
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {

  SpeechRecognition _speechRecognition;
  bool isAvailable = false;
  bool isListening = false;

  String resultText = "";

  @override
  void initState(){
    super.initState();
    initSpeechRecognizer();
  }

  initSpeechRecognizer(){
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) => 
      setState(() => isAvailable = result )
    );
    _speechRecognition.setRecognitionStartedHandler(() => 
      setState(() => isListening = true )
    );
    _speechRecognition.setRecognitionResultHandler((String speech) => 
      setState(() => resultText = speech )
    );
    _speechRecognition.setRecognitionCompleteHandler(() => 
      setState(() => isListening = false )
    );
    _speechRecognition.activate().then((result) => 
      setState(() => isAvailable = result )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.cancel),
                  mini: true,
                  backgroundColor: Colors.deepOrange,
                  onPressed: () {
                    if (isListening)
                      _speechRecognition.cancel().then(
                            (result) => setState(() {
                                  isListening = result;
                                  resultText = "";
                                }),
                          );
                  },
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
                FloatingActionButton(
                  child: Icon(Icons.stop),
                  mini: true,
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    if (isListening)
                      _speechRecognition.stop().then(
                            (result) => setState(() => isListening = result),
                          );
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.cyanAccent[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}