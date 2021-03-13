import 'package:flutter/material.dart';
import 'DataStructures.dart';

class Summary extends StatelessWidget {

  final Map current;
  final Listings myListings;
  Summary({this.current, this.myListings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              myListings.addListing(current["photo"], current["description"], current["origin"], current["completed"]);
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text("Done"),
          ),
        ),
      ),
    );
  }
}