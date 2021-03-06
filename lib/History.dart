//	Copyright (C) 2021 Rumesh Sudhaharan, Sridharan Arvind Srinivasan
//	This file is part of redonum.
// 
//	redonum is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
// 
//	redonum is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
// 
//	You should have received a copy of the GNU General Public License
//	along with redonum.  If not, see <https://www.gnu.org/licenses/>.

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
                        color: (myListings.data[num].completed) ? Colors.grey : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(myListings.data[num].title)
															),
                              Expanded(
                                child: Text(myListings.data[num].description)
															),
                            ],
                      		),
                        )
											),
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
                var num = received.data.length - index - 1;
                if (index < received.data.length) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(data: received.data[num])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Card(
                          child: Row(
                        children: [
                          Expanded(
                            child: Text(received.data[num].title)
													),
                          Expanded(
                            child: Text(received.data[num].description)
													),
                          Expanded(
                            child: Text(received.data[num].origin.toString())
													),
                        ],
                      )),
                    ),
                  );
                } else
                  return null;
              },
            ),
          ),
        ]),
      ),
    );
  }
}
