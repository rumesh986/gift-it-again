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

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(
            icon: Icon(Icons.help), 
            onPressed: (){}
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Row(
						children: [
							Text("Theme"),
							Spacer(),
							ElevatedButton(
								onPressed: (){}, 
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
								child: null
							),
							Spacer(),
							ElevatedButton(
								onPressed: (){}, 
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
								child: null
							),
							Spacer(),
							ElevatedButton(
								onPressed: (){}, 
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
								child: null
							),
							Spacer(),
							ElevatedButton(
								onPressed: (){}, 
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
								child: null
							),
							Spacer(),
						],
        	)
        ]
      ),  
    );
  }
}
