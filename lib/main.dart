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

