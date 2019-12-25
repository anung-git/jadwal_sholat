import 'package:flutter/material.dart';

class Dfplayer extends StatefulWidget {
  Dfplayer({Key key}) : super(key: key);

  _DfplayerState createState() => _DfplayerState();
}

class _DfplayerState extends State<Dfplayer> {
  //membuat fungsi
  // List<Widget> createItems(int count) {
  //   List<Widget> items = List<Widget>();
  //   for (var i = 0; i < count; i++) {
  //     items.add(ListTile(
  //       title: Text('Surat ${i + 1}'),
  //       // leading: Icon(Icons.music_note),
  //       trailing: Icon(Icons.play_arrow),
  //     ));
  //     items.add(Divider(color: Colors.black26));
  //   }
  //   return items;
  // }
  void play(int l) {
    print(l);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: 114,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Al-Quran Surat ${index + 1}'),
            leading: Icon(Icons.music_note),
            trailing: Icon(Icons.play_arrow),
            onTap: () {
              play(index);
            },
          );
        },
        separatorBuilder: (context,index){
          return Divider();
        },
      ),
    );
    // child: ListView(
    //     padding: EdgeInsets.all(30.0), children: createItems(114)));
  }
}
