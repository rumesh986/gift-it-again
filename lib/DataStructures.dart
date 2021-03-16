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
Listings recommendations = Listings();
Listings received = Listings();


class Suggestions
{
  Map<String, List<String>> data;
  Suggestions()
  {
    data = {};
  }

  void addSuggestion(String category, String item)
  {
    data[category].add(item);
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
  String photo;
  Origin origin;
  bool completed;
  bool isNew; 
  String location;

  List<String> tags;

  Listing()
  {
    title = "";
    description = "";
    photo = "";
    origin = Origin.none;
    completed = false;
    isNew = true;
    location = "";
    tags = [];
  }

	Map<String, dynamic> toMap() {
		return {
			"title": title,
			"description": description,
			"photo": photo,
			"origin": origin.index,
			"completed": completed,
			"isNew": isNew,
			"location": location,
			"tags": tags
		};
	}

  Widget showData()
  {
    return Container(
      child: Column(
        children: [
          Container(
            height: 400,
            child: Center(child: Text("Photo:" + this.photo))
          ),
          Text("Description: " + this.description),
          Text("Location:" + this.location),
          Text("Tags:"),
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

  Interests(this.tags, {this.name});
}