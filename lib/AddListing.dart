import 'package:flutter/material.dart';
import 'Giveaway.dart';
import 'BarterDetails.dart';
import 'DataStructures.dart';

class AddListing extends StatelessWidget {
  final Listings myListings;

  AddListing({this.myListings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Listing"),
      ),
      body: ListView(
        children: [
          //1 data entry
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              //color: Colors.black,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center(
                      child: TextField(
                          minLines: 2,
                          maxLines: 15,
                          decoration: InputDecoration.collapsed(
                              hintText:
                                  "Enter the Description for the product here")),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          child: Icon(
                        Icons.add_a_photo,
                        size: MediaQuery.of(context).size.width / 4,
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),

          //2 barter
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: RaisedButton(
                child: Text(
                  "Barter",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  myListings.addListing1("Barter");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BarterDetails(myListings: myListings)));
                },
              ),
            ),
          ),

          //3 give away
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: RaisedButton(
                child: Text(
                  "Give to charity",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  myListings.addListing1("Giveaway");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Giveaway(myListings: myListings)));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
