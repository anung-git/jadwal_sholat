import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart'; //mengambil nama lokasi
import 'package:geolocator/geolocator.dart';

class Lokasi extends StatefulWidget {
  Lokasi({Key key}) : super(key: key);
  _LokasiState createState() => _LokasiState();
}

class _LokasiState extends State<Lokasi> {
  String laitu, longitu, alamat;
  void _getLocation() async {
    Position posisi;
    try {
      posisi = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      var coordinates = new Coordinates(posisi.latitude, posisi.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      alamat = addresses.first.locality;
    } catch (e) {
      alamat = "";
      laitu = "";
      longitu = "";
    } finally {
      setState(() {
        this.laitu = posisi.latitude.toString();
        this.longitu = posisi.longitude.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: TextEditingController(text: this.alamat),
            decoration: InputDecoration(
              enabled: false,
                hintText: "Nama",
                labelText: "Nama lokasi",
                icon: Icon(Icons.add_location, color: Colors.red),
                border: OutlineInputBorder()),
            onChanged: (String a) {},
          ),
          Container(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: this.longitu),
            decoration: InputDecoration(
                hintText: "Longitude",
                labelText: "Longitude",
                icon: Icon(Icons.create,
                color: Colors.green,),
                border: OutlineInputBorder()),
          ),
          Container(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: this.laitu),
            decoration: InputDecoration(
                hintText: "Laitude",
                labelText: "Laitude",
                icon: Icon(
                  Icons.create,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder()),
          ),
          Container(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () {
              _getLocation(); 
            },
            color: Colors.blue,
            child: Text(
              "Load GPS",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }
}
