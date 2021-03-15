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

class Summary extends StatelessWidget {

  final Listing current;
  Summary({this.current});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
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
          Container(child:current.showData()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Interests indicated:",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Card(child:current.showData()), //TODO make a interests object for the info and show
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