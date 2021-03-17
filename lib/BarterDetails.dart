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
import 'Summary.dart';
import 'DataStructures.dart';

class BarterDetails extends StatefulWidget {

  Listing current;
  Interests currInterest = Interests();

  BarterDetails({this.current});

  @override
  _BarterDetailsState createState() => _BarterDetailsState();
}

class _BarterDetailsState extends State<BarterDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barter Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical:18.0),
            child: Text(
              "What would you like to trade with",
              style: TextStyle(fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Enter the Name"),
              onChanged: (value){
                widget.currInterest.name = value;
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Enter some tags you'd like to search for"),
              onSubmitted: (value) => widget.currInterest.tags.addAll(value.split(" ")),
            ),
          ),
          Expanded(
            flex:7,
            child: ListView(
              children: [
                //Text("here be recommendations"),
                //Text("here be suggestions"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(current: widget.current, barter: true,currInterest: widget.currInterest,)));
            },
            child: Text("Done"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}