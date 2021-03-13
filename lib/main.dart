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
import 'HomePage.dart';
import 'DataStructures.dart';
import 'AddListing.dart';
import 'History.dart';
import 'Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
	List<Widget> _pages;
	List<String> _titles;
	HomePage _homePage;
	History _historyPage;
	Profile _profilePage;

	int _selectedWidget;

	_MyAppState() {
		_homePage = HomePage();
		_historyPage = History();
		_profilePage = Profile();

		_pages = [
			_homePage,
			_homePage,
			_historyPage,
			_profilePage
		];

		_titles = [
			"Home",
			"Home",
			"History",
			"Profile"
		];

		_selectedWidget = 0;
	}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
			home: Scaffold(
				appBar: AppBar(
					title: Text(_titles[_selectedWidget])
				),
				body: _pages[_selectedWidget],
				bottomNavigationBar: BottomNavigationBar(
					type: BottomNavigationBarType.fixed,
					items: [
						BottomNavigationBarItem(
							label: "Home",
							icon: Icon(Icons.home),
						),
						BottomNavigationBarItem(
							label: "Home",
							icon: Icon(Icons.home),
						),
						BottomNavigationBarItem(
							label: "History",
							icon: Icon(Icons.history)
						),
						BottomNavigationBarItem(
							label: "Profile",
							icon: Icon(Icons.account_circle)
						)
					],
					onTap: (index) {
						setState(() =>
								_selectedWidget = index
							
						);
					},
				),
				floatingActionButton: FloatingActionButton(
					child: Icon(Icons.add),
					onPressed: () {
						Navigator.push(
							context, 
							MaterialPageRoute(builder: (context) => AddListing(myListings: myListings)),
						);
					}
				),
				floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
			)
    );
  }
}

