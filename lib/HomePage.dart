import 'package:flutter/material.dart';
import 'AddListing.dart';
import 'History.dart';
import 'Profile.dart';
import 'DataStructures.dart';

Listings a = Listings();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("History"), icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              title: Text("Profile"), icon: Icon(Icons.account_circle)),
        ],
        onTap: (index){
          if(index == 0)
          {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }

          if(index == 2)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => History(myListings: a)));
          }

          if(index == 3)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddListing(myListings:a)));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
