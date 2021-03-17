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

class Summary extends StatelessWidget {

  final Listing current;
  final bool barter;
  final String selected; 
  final Interests currInterest;

  Summary({this.current, this.barter, this.selected, this.currInterest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Listed Item"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Listing to be submitted:",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Card(child:current.showData(half: false)),
          SizedBox(height:50),
          (this.barter) ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Item of interest:",
              style: TextStyle(fontSize: 24),
            ),
          )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Selected charity:",
              style: TextStyle(fontSize: 24),
            ),
          ),
          (this.barter) ? Card(child:currInterest.showData()) 
          : Card(
            child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(selected),
            )
          ), 
          SizedBox(height:60)
        ],
      ),
      floatingActionButton: ElevatedButton(
            onPressed: (){
              myListings.addListing(current);
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text("Done"),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}