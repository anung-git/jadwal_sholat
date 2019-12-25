import 'package:flutter/material.dart';

class RText extends StatefulWidget {
  RText({Key key}) : super(key: key);

  _RTextState createState() => _RTextState();
}

class _RTextState extends State<RText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: TextField(
          maxLines: 30,
          maxLength: 500,
          decoration: InputDecoration(
            // counter:widget,
            hintText: 'Masukan Text',
            labelText: 'Running Text',
            // icon: Icon(Icons.text_fields),
            border: OutlineInputBorder(),
          ),
        ));
  }
}
