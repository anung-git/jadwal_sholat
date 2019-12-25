import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<String> settings = [
    'Auto mode',
    'Pump',
    'Mobile Data',
    'Bluetooth'
  ];

  final List<String> settingTitle = [
    'kota',
    'beep',
    'timer adzan subuh',
    'timer adzan duhur',
    'timer adzan ashar',
    'timer adzan maghrib',
    'timer adzan isya',
    'timer adzan jumat',
    'iqomah subuh',
    'iqomah duhur',
    'iqomah ashar ',
    'iqomah maghrib',
    'iqomah isya',
    'iqomah jumat',
    'lama sholat subuh',
    'lama sholat duhur',
    'lama sholat ashar ',
    'lama sholat maghrib',
    'lama sholat isya',
    'lama sholat jumat',
    'tartil subuh', //' 0,ati dan >0 hid'up
    'tartil duhur',
    'tartil ashar',
    'tartil maghrib ',
    'tartil isya',
    'tartil jumat',
    'kecerahan 1',
    'kecerahan 2',
    'kecerahan 3',
    'kecerahan 4',
    'jam kecerahan 1',
    'jam kecerahan 2',
    'jam kecerahan 3',
    'jam kecerahan 4',
    'tambah kurang subuh',
    'tambah kurang duhur',
    'tambah kurang ashar ',
    'tambah kurang maghrib ',
    'tambah kurang isya',
    'jadwal fix subuh',
    'jadwal fix duhur',
    'jadwal fix ashar',
    'jadwal fix maghrib',
    'jadwal fix isya',
    'mazhab ashar ',
    'set kota gmt',
    'set kota lnt',
    'set kota bjr ',
  ];
  List<bool> settingValues = [false, false, false, false];

  void timeSpiner(BuildContext context) {
    var alertDialog = AlertDialog(
      // backgroundColor: Colors.grey,
      title: Text('Informasi'),
      content: Text('jam'),

      actions: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[])
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  TimeOfDay time = TimeOfDay.now();
  Future<Null> pilihWaktu(BuildContext context) async {
    final TimeOfDay selected = await showTimePicker(
      context: context,
      initialTime: this.time,
      builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    );
      },
    );

    if (selected != null && selected != this.time) {
      setState(() {
        print(selected);
      });
    }
  }

  DateTime date = DateTime.now();

  Future<Null> pilihTanggal(BuildContext context) async {
    final DateTime selected = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2021));

    if (selected != null && selected != this.date) {
      setState(() {
        this.date = selected;
      });
    }
  }

  void onSwitch1Changed(bool value) {
    setState(() {
      this.settingValues[0] = value;
    });
    print(settingValues);
  }

  List<Widget> createItems() {
    List<Widget> items = List<Widget>();
    for (var i = 0; i < 48; i++) {
      items.add(ListTile(
        title: Text(settingTitle[i]),
        leading: Icon(
          Icons.settings,
          color: Colors.blue,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          pilihWaktu(context);
          print('object $i');
        },
      ));
      items.add(Divider(color: Colors.black26));
    }

    for (var i = 0; i < 50; i++) {
      items.add(SwitchListTile(
        value: true,
        title: Text('Item ${i + 1}'),
        secondary: Icon(
          Icons.timer,
          color: Colors.green,
        ),
        onChanged: (bool vlue) {
          print('object $i');
        },
      ));
      items.add(Divider(color: Colors.black26));
    }
    return items;
  }

  //   SwitchListTile(
  //     value: this.settingValues[0],
  //     onChanged: (bool value) {
  //       onSwitch1Changed(value);
  //     },
  //     title: Text(this.settings[0]),
  //     secondary: Icon(Icons.autorenew),
  //   ),
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5), child: ListView(children: createItems()));
    // Container(
    // color: Colors.grey[300],
    // child:
    // ListView(children: createItems(20)

    // <Widget>[
    //   ListTile(
    //     title: Text("Subuh"),
    //     subtitle: Text("count down iqomah subuh"),
    //     leading: Icon(
    //       Icons.timer,
    //       color: Colors.green,
    //     ),
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Text("10:00"),
    //         Icon(Icons.arrow_forward_ios)
    //       ],
    //     ),
    //     onTap: () {},
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text("Dzuhur"),
    //     subtitle: Text("count down iqomah Dzuhur"),
    //     leading: Icon(Icons.timer, color: Colors.green[600]),
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Text("10:00"),
    //         Icon(Icons.arrow_forward_ios
    //             // color: Colors.,
    //             )
    //       ],
    //     ),
    //     onTap: () {},
    //   ),
    //   Divider(),
    //   SwitchListTile(
    //     value: this.settingValues[0],
    //     onChanged: (bool value) {
    //       onSwitch1Changed(value);
    //     },
    //     title: Text(this.settings[0]),
    //     secondary: Icon(Icons.autorenew),
    //   ),
    //   Divider(),
    //   SwitchListTile(
    //     value: this.settingValues[1],
    //     onChanged: (bool value) {
    //       onSwitch2Changed(value);
    //     },
    //     title: Text(this.settings[1]),
    //     secondary: Icon(Icons.wifi),
    //   ),
    //   Divider(),
    //   SwitchListTile(
    //     value: this.settingValues[2],
    //     onChanged: (bool value) {
    //       onSwitch3Changed(value);
    //       pilihTanggal(context);
    //     },
    //     title: Text(this.settings[2]),
    //     secondary: Icon(Icons.data_usage),
    //   ),
    //   Divider(),
    //   SwitchListTile(
    //     value: this.settingValues[3],
    //     onChanged: (bool value) {
    //       onSwitch4Changed(value);
    //       pilihWaktu(context);
    //     },
    //     title: Text(this.settings[3]),
    //     secondary: Icon(Icons.bluetooth),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text("Judul"),
    //     leading: Text("kanan"),
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[Text("10:00"), Icon(Icons.music_note)],
    //     ),
    //     // onTap: (){
    //     //   // pilihWaktu(context);
    //     // },
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text("Judul"),
    //     subtitle: Text("sub"),
    //     leading: Text("kiri"),
    //     trailing: Text("dat >"),
    //     onTap: () {
    //       // pilihWaktu(context);
    //     },
    //   )
    // ],
    // ));
  }
}
