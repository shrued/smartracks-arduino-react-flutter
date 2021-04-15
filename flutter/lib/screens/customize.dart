import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Customize extends StatefulWidget {
  @override
  _CustomizeState createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  String name = "", inventory = "0", weight = "0", scale = "0";
  final databaseRef = FirebaseDatabase.instance.reference();

  readData() {
    databaseRef.once().then((DataSnapshot snapshot) {
      setState(() {
        inventory = snapshot.value['inventory'].toString();
        name = snapshot.value['name'];
        weight = snapshot.value['weight'].toString();
        scale = snapshot.value['scale'].toString();
      });
    });
  }

  void updateData() {
    databaseRef.update({
      'inventory': (int.parse(scale) / int.parse(weight)).floor(),
    });
  }

  @override
  Widget build(BuildContext context) {
    readData();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Name: " + name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Text(
              "Inventory: " + inventory,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Text(
              "Item Weight: " + weight,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Text(
              "Scale Weight: " + scale,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            RaisedButton(
              child: Text(
                'Refresh',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              color: Colors.blue[400],
              onPressed: () {
                updateData();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }
}
