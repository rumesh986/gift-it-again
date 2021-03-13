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
import 'Giveaway.dart';
import 'BarterDetails.dart';
import 'DataStructures.dart';

class AddListing extends StatefulWidget {

  AddListing();

  @override
  _AddListingState createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  Map current = {};

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
                          onChanged: (value)
                          {
                              current["photo"] = "Bleh";
                              current["description"] = value; 
                          },
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
              child: ElevatedButton(
                child: Text(
                  "Barter",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  current["origin"] = "Barter";
                  current["completed"] = false;
                  //widget.myListings.addListing1("Barter");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BarterDetails(current: current)));
                },
              ),
            ),
          ),

          //3 give away
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: ElevatedButton(
                child: Text(
                  "Give to charity",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  current["origin"] = "Giveaway";
                  current["completed"] = false;
                  //widget.myListings.addListing1("Giveaway");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Giveaway(current: current)));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
