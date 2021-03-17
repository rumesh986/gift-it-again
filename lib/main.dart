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
import 'HomePage.dart';
import 'AddListing.dart';
import 'History.dart';
import 'Profile.dart';
import 'Settings.dart';

void main() {
	WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
	List<Widget> _pages;
	HomePage _homePage;
	History _historyPage;
	Profile _profilePage;
  Settings _settingsPage;

	int _selectedIndex;

	_MyAppState() {
		_homePage = HomePage();
		_historyPage = History();
		_profilePage = Profile();
    _settingsPage = Settings();


		_pages = [
			_homePage,
			_historyPage,
			_profilePage,
      _settingsPage
		];

		_selectedIndex = 0;
	}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redonum',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
			home: Scaffold(
				body: _pages[_selectedIndex],
				bottomNavigationBar: BottomNavigationBar(
					type: BottomNavigationBarType.fixed,
					items: [
						BottomNavigationBarItem(
							label: "Home",
							icon: Icon(Icons.home),
						),
						BottomNavigationBarItem(
							label: "Submissions",
							icon: Icon(Icons.history)
						),
						BottomNavigationBarItem(
							label: "Profile",
							icon: Icon(Icons.account_circle)
						),
            BottomNavigationBarItem(
							label: "Settings",
							icon: Icon(Icons.settings),
						),
					],
					onTap: (index) {
						setState(() =>
								_selectedIndex = index
						);
					},
					currentIndex: _selectedIndex,
				),
				floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => AddListing()),
                );
              }
            ),
				),
				floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
			)
    );
  }
}

