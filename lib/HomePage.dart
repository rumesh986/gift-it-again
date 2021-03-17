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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (value){
          if(value.primaryDelta > 15.0)
          {
            //print("swipe");
            index++;
          }
          else if(value.primaryDelta < -15.0)
          {
            //print("swipe");
            index--;
          }

          if(index == myListings.data.length)
          {
            index = 0;
          }

          if(index < 0)
          {
            index = myListings.data.length - 1;
          }
          //print(index);
          setState(() {});
      },
      child: Scaffold(
			appBar: AppBar(
				title: Text("Home"),
			),
			body: Container(
				child: (myListings.data.isNotEmpty) ? myListings.data[index].showData() : null
		),
    );
		
	}
}
