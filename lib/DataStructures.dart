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

Listings myListings = Listings();
Listings recommendations = Listings();

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
    this.data = {};
  }

  Map<String,Map> data;
  
  void addListing(String photo, String description, String origin, bool completed)
  {
    //print(stuff);
    //data.add(stuff);
    //print(data);
    data[data.length.toString()] = {};
    data[(data.length - 1).toString()]["photo"] = photo;
    data[(data.length - 1).toString()]["description"] = description;
    data[(data.length - 1).toString()]["origin"] = origin;
    data[(data.length - 1).toString()]["completed"] = completed;
    print(data);
  }

  void addListing1(String origin)
  {
    //print(stuff);
    //data.add(stuff);
    //print(data.length);
    //print(data);
    data[data.length.toString()] = {};
    data[(data.length - 1).toString()]["photo"] = "${data.length - 1}";
    data[(data.length - 1).toString()]["description"] = "Test ${data.length - 1}";
    data[(data.length - 1).toString()]["origin"] = origin;
    data[(data.length - 1).toString()]["completed"] = true;
    //print(data);
  }

  void getRecommendations(Map listing)
  {
    
  }
}

