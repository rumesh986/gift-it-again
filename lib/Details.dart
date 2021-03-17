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

class Details extends StatefulWidget {
  Listing data;

  Details({this.data});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.title),
        actions: [
          !widget.data.completed
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                )
              : IconButton(
                  onPressed: null,
                  icon: Icon(Icons.edit),
                ),
        ],
      ),
      body: SingleChildScrollView
        (
          scrollDirection: Axis.vertical,
          child: widget.data.showData(half: false),
        )
    );
  }
}
