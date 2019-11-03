import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Xylophone',
      scaffoldBody: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SingleNote(
            noteColor: Colors.redAccent,
            noteNumber: 1,
          ),
          SingleNote(
            noteColor: Colors.yellowAccent,
            noteNumber: 2,
          ),
          SingleNote(
            noteColor: Colors.lightBlueAccent,
            noteNumber: 3,
          ),
          SingleNote(
            noteColor: Colors.white,
            noteNumber: 4,
          ),
          SingleNote(
            noteColor: Colors.greenAccent,
            noteNumber: 5,
          ),
          SingleNote(
            noteColor: Colors.black,
            noteNumber: 6,
          ),
        ],
      ),
      floatingActionButton: null,
    );
  }
}

class SingleNote extends StatelessWidget {
  final Color noteColor;
  final int noteNumber;

  SingleNote({this.noteNumber, this.noteColor});

  static AudioCache player = AudioCache();

  void playNote(int noteNumber) {
    player.play('note$noteNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playNote(noteNumber);
        },
        child: Container(
          color: noteColor,
        ),
      ),
    );
  }
}
