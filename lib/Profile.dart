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

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Profile"),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: (){})
        ],
			),
			body: ListView(
        children: [
          SizedBox(height: 30,),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              "DP",
              style: TextStyle(fontSize: 26),
              ),
          ),
          Column(
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          Center(
            child: Text(
              "Bio",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Center(
            child: Text(
                " X Points",
                style: TextStyle(fontSize: 26),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              minHeight: 25,
              value: 0.66,
            ),
          ),
          Center(
            child: Text(
                " N points to bleh",
                style: TextStyle(fontSize: 26),
              ),
          ),
        ],
      ),
		);
  }
}