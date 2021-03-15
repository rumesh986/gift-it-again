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
  Listings()
  {
    //this.data = {};
    this.data = [];
  }

  //Map<String,Map> data;
  List<Listing> data;
  
  void addListing(Listing listing)
  {
    //print(stuff);
    //data.add(stuff);
    //print(data);
    data.add(listing);
    //print(data);
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

  Widget showData()
  {
    return Container(
      child: Column(
        children: [
          Text("Photo:" + this.photo),
          Text("Description: " + this.description),
          Text("Location:" + this.location),
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
