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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var index = 0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: Text("Home"),
			),
			body: Container(
				height: MediaQuery.of(context).size.height,
				width: MediaQuery.of(context).size.height,
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Padding(
							padding: const EdgeInsets.all(8.0),
							child: Text("Giveaway"),
						),
						Expanded(
							child: GestureDetector(
								onHorizontalDragUpdate: (value){
									if(value.primaryDelta > 15.0)
										index++;
									else if(value.primaryDelta < -15.0)
										index--;
									if(index == myListings.data.length)
										index = 0;
									if(index < 0)
										index = myListings.data.length - 1;
									setState(() {});
								},
								child: (myListings.data.isNotEmpty) ? 
								myListings.data[index].showData(half: true) 
								: Container(height: 0,width: 0,),
							)
						),
						Padding(
							padding: const EdgeInsets.all(10.0),
							child: Text("Barter"),
						),
						Expanded(
							child: GestureDetector(
								onHorizontalDragUpdate: (value){
									if(value.primaryDelta > 15.0)
										index++;
									else if(value.primaryDelta < -15.0)
										index--;
									if(index == myListings.data.length)
										index = 0;
									if(index < 0)
										index = myListings.data.length - 1;
									setState(() {});
								},
								child: (myListings.data.isNotEmpty) ? 
								myListings.data[index].showData(half: true) 
								: Container(child:Center(child: Text("No barters"))),
							),
						),
					]
				),
			)
		);
	}
}
