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

  BarterDetails({this.current});

  @override
  _BarterDetailsState createState() => _BarterDetailsState();
}

class _BarterDetailsState extends State<BarterDetails> {

  List<Widget> searchParams = [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: "Enter the Name"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: "Enter the Category"),
        ),
      ),
   ];

  bool search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barter Details"),
        actions: [
          IconButton(
            onPressed: () {
              search = true;
              setState(() {});
            },
            icon:Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: (search) ? 1 : 0,
            child: (search) ? searchParams[0] : Container(width: 0, height: 0,),
          ),
          Expanded(
            flex: (search) ? 1 : 0,
            child: (search) ? searchParams[1] : Container(width: 0, height: 0,),
          ),
          Expanded(
            flex:7,
            child: ListView(
              children: [
                Text("here be recommendations"),
                Text("here be suggestions"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(current: widget.current)));
            },
            child: Text("Done"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}