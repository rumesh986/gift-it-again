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
  Listing current  = Listing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Listing"),
      ),
      body: Column(
        children: [
					Padding(
						padding: EdgeInsets.all(5),
						child: IconButton(
							icon: Icon(Icons.add_a_photo),
							iconSize: MediaQuery.of(context).size.width / 5,
							onPressed: () => current.photo = "Bleh",
						),
					),
					Padding(
						padding: EdgeInsets.all(5),
						child: TextField(
							decoration: InputDecoration(
								labelText: "Enter the name of the product here"
							),
							onChanged: (value) {
								current.title = value;
							},
						),
					),
					Padding(
						padding: EdgeInsets.all(5),
						child: TextField(
							decoration: InputDecoration(
								labelText: "Enter the description of the product here"
							),
							onChanged: (value) {
								current.description = value;
							},
						),
					),
					Spacer(),
          //1 data entry
					Container(
						alignment: Alignment.bottomCenter,
						child: Row(
							children: [
								Expanded(
									child: Padding(
										child: ElevatedButton(
											child: Text("Barter", style: TextStyle(fontSize: 22),),
											onPressed: () {
												current.origin = Origin.barter;
												current.completed = false;
												Navigator.push(
													context, MaterialPageRoute(
														builder: (context) => BarterDetails(current: current)
													)
												);
											}
										),
										padding: EdgeInsets.all(5),
									)
								),
								Expanded(
									child: Padding(
										child: ElevatedButton(
											onPressed: () {
												current.origin = Origin.giveaway;
												current.completed = false;
												Navigator.push(
													context, 
													MaterialPageRoute(
														builder: (context) => Giveaway(current: current)
													)
												);
											},
											child: Text("Give away", style: TextStyle(fontSize: 22),)
										),
										padding: EdgeInsets.all(5),
									)
								)
							],
						),
					)
        ],
      ),
    );
  }
}
