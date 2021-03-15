//	Copyright (C) 2021 Rumesh Sudhaharan, Sridharan Arvind Srinivasan
//	This file is part of gift-it-again.
// 
//	gift-it-again is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
// 
//	gift-it-again is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
// 
//	You should have received a copy of the GNU General Public License
//	along with gift-it-again.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'DataStructures.dart';
import 'Details.dart';

class History extends StatelessWidget {
  final List<Tab> tabs = [
    Tab(
      text: "My Listings",
    ),
    Tab(
      text: "Received",
    )
  ];

  History();

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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(data: myListings.data[num])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Card(
                          child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  myListings.data[num].photo)),
                          Expanded(
                              child: Text(myListings.data[num].description)),
                          Expanded(
                              child: Text(
                                  myListings.data[num].origin.toString())),
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
