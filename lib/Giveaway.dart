import 'package:flutter/material.dart';
import 'Summary.dart';
import 'DataStructures.dart';

class Giveaway extends StatelessWidget {

  final Listings myListings;
  final Map current;

  Giveaway({this.myListings, this.current});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Give away"),
      ),
      body: Container(
        child: ListView.builder(
              itemBuilder: (context, index) {
                return null;
              },
            ),
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(option:"Barter")));
            },
            child: Text("Done"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}