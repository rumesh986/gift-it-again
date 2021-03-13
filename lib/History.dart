import 'package:flutter/material.dart';
import 'DataStructures.dart';
import 'Details.dart';

//Listings a = Listings();

class History extends StatelessWidget {
  final List<Tab> tabs = [
    Tab(
      text: "My Listings",
    ),
    Tab(
      text: "Received",
    )
  ];

  final Listings myListings;

  History({this.myListings});

  @override
  Widget build(BuildContext context) {
    //myListings.addListing("1", "Test 1");
    //myListings.addListing("2", "Test 2");
    //myListings.addListing("3", "Test 3");
    //myListings.addListing("4", "Test 4");

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Listings"),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                var num = myListings.data.length - index - 1;
                if (index < myListings.data.length) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(data: myListings.data[index.toString()])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Card(
                          child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  myListings.data[num.toString()]["photo"])),
                          Expanded(
                              child: Text(myListings.data[num.toString()]
                                  ["description"])),
                          Expanded(
                              child: Text(
                                  myListings.data[num.toString()]["origin"])),
                        ],
                      )),
                    ),
                  );
                } else
                  return null;
              },
            ),
          ),
          Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return null;
              },
            ),
          ),
        ]),
      ),
    );
  }
}
