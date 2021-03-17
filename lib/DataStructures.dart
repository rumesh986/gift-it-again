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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Listings myListings = Listings();
Listings recommendationB = Listings();
Listings recommendationG = Listings();
Listings received = Listings();
Interests interests = Interests();
List<Charity> myCharities;

class Charity
{
  String name;
  String targets;

  Charity()
  {
    name = "";
    targets = "";
  }
}

class Listings
{
	bool _flutterFireInit = false;
	bool _flutterFireError = false;
  
	List<Listing> data;

  Listings()
  {
		initFlutterFire();
    this.data = [];
  }

	void initFlutterFire() async {
		try {
			await Firebase.initializeApp();
		  _flutterFireInit = true;
		} catch(e) {
		  _flutterFireError = true;
		}
	}

	Future<void> addData(Map<String, dynamic> obj) {
		CollectionReference test = FirebaseFirestore.instance.collection('test');
		return test.add(obj);
	}
  
  void addListing(Listing listing)
  {
    data.add(listing);
		addData(listing.toMap());
  }

  // void addListing1(String origin)
  // {
  //   //print(stuff);
  //   //data.add(stuff);
  //   //print(data.length);
  //   //print(data);
  //   data[data.length.toString()] = {};
  //   data[(data.length - 1).toString()]["photo"] = "${data.length - 1}";
  //   data[(data.length - 1).toString()]["description"] = "Test ${data.length - 1}";
  //   data[(data.length - 1).toString()]["origin"] = origin;
  //   data[(data.length - 1).toString()]["completed"] = true;
  //   //print(data);
  // }

  void getRecommendations(Map listing)
  {

  }
}

enum Origin
{
  none,
  barter,
  giveaway
} 

class Listing
{
  String title;
  String description;
  Image photo;
  Origin origin;
  bool completed;
  bool isNew; 

  List<String> tags;

  Listing()
  {
    title = "No title added";
    description = "No description added";
    photo = Image.asset("assets/redonum.jpeg", scale: 10,);
    origin = Origin.none;
    completed = false;
    isNew = true;
    tags = [];
  }

	Map<String, dynamic> toMap() {
		return {
			"title": title,
			"description": description,
			//"photo": photo,
			"origin": origin.index,
			"completed": completed,
			"isNew": isNew,
			"tags": tags
		};
	}

  Widget showData({bool half})
  {
    return Container(
      child: Column(
        children: [
          Container(
            height: (half) ? 150 : 400,
            child: this.photo,
          ),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Text("Name: " + this.title),
          ),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Text("Description: " + this.description),
          ),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Text("Condition: " + ((this.isNew)? "New":"Used")),
          ),
          (!half) ? Text("Tags:") : Container(height:0, width:0),
          (!half) ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:[
                for(var i = 0; i<this.tags.length;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(tags[i]),
                    ),
                  ),
              ],
            ),
          )
          : Container(height:0, width:0),
          SizedBox(height:20),
        ],
      ),
    );
  }
}

class User
{
  String name;
  String bio;
  int points;
  bool incentive;

  User()
  {
    name = "";
    bio = "";
    points = 0;
    incentive = false;
  }
}

class Interests
{
  String name;
  List<String> tags;

  Interests()
  {
    name = "No name provided";
    tags = [];
  }

  Widget showData()
  {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name: " + this.name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (this.tags.length == 0) ? Text("Tags: No tags provided") :Text("Tags:"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:[
                for(var i = 0; i<this.tags.length;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(tags[i]),
                    ),
                  ),
              ],
            ),
          ),
        ],
      )
    );
  }
}