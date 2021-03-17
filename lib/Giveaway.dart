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
import 'Summary.dart';
import 'DataStructures.dart';

class Giveaway extends StatelessWidget {

  Listing current;
  String selectedCharity;

  Giveaway({this.current});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Give away"),
      ),
      body: Container(
        child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:(){
                    selectedCharity = "Charity Name " + index.toString();
                  },
                  child: Card(
                    child:Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child:Text("Charity Name " + index.toString())
                    )
                  ),
                );
              },
            ),
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
              if(selectedCharity != null)
                Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(current:current,barter:false, selected: selectedCharity,)));
            },

            child: Text("Done"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}