import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_settings/app_settings.dart';
import './scren1.dart' as satu;
import './scren2.dart' as dua;
import './scren3.dart' as tiga;
import './scren4.dart' as empat;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jadwal Sholat',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  TabController tabController;

  void syncWaktu(BuildContext context) {
    DateTime sekarang = DateTime.now();
    String waktuSekarang = DateFormat('kk:mm:ss \nd-M-y').format(sekarang);
    var alertDialog = AlertDialog(
      title: Text('Syncronisasi Waktu'),
      content: Text(
        waktuSekarang,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
      actions: <Widget>[
        // Text(waktuSekarang)
        // ,

        RaisedButton(
          color: Colors.red,
          child: Text(
            'Cencel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            //waktu akan di syncronisasi
          },
        ),
        RaisedButton(
          color: Colors.green,
          child: Text(
            'Ok',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            //waktu akan di syncronisasi
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green[600],
        title: Text("Jadwal Sholat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              syncWaktu(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.wifi),
            onPressed: () {
              // AppSettings.openLocationSettings();
              AppSettings.openWIFISettings();
            },
          ),
          IconButton(
            icon: Icon(Icons.bluetooth),
            onPressed: () {
              // AppSettings.openLocationSettings();
              AppSettings.openBluetoothSettings();
            },
          ),
        ],
        // elevation: .0,
        bottom: TabBar(
          controller: tabController,
          // labelColor: Colors.red,
          indicatorColor: Colors.red,
          indicatorWeight: 3.0,
          tabs: [
            Tab(icon: Icon(Icons.add_location), text: "Lokasi"),
            Tab(icon: Icon(Icons.text_fields), text: "Text"),
            Tab(icon: Icon(Icons.settings), text: "Setting"),
            Tab(icon: Icon(Icons.music_note), text: "Tartil")
          ],
          // controller: tabController,
          // // labelColor: Colors.red,
          // indicatorColor: Colors.red,
          // indicatorWeight: 3.0,
          // tabs: <Widget>[

          //   Icon(Icons.add_location),
          //   Icon(Icons.text_fields),
          //   Icon(Icons.settings),
          //   Icon(Icons.music_note),
          // ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          satu.Lokasi(),
          dua.RText(),
          tiga.Setting(),
          empat.Dfplayer()
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ), //
    );
  }
}
