import 'package:flutter/material.dart';
import 'Summary.dart';
import 'DataStructures.dart';

class BarterDetails extends StatelessWidget {

  final Listings myListings;

  BarterDetails({this.myListings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barter Details"),
      ),
      body: Container(
      ),
      floatingActionButton: RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(option:"Barter")));
            },
            child: Text("Done"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}