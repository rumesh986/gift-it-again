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
import 'package:gift_it_again/ChipChoice.dart';
import 'package:firebase_ml_custom/firebase_ml_custom.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:io';

import 'DataStructures.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var index = 0;
	Interpreter interpreter;
	// var output = List.filled(100,0).reshape([100,1]);
	// var output = List.filled(1,1);
	var output = [[]];

	Future<void> _firebaseTest() async {
		FirebaseCustomRemoteModel remoteModel = FirebaseCustomRemoteModel('test_model');
		FirebaseModelDownloadConditions conditions = FirebaseModelDownloadConditions(
			androidRequireWifi: false,
			androidRequireCharging: false,
		);

		FirebaseModelManager modelManager = FirebaseModelManager.instance;

		await modelManager.download(remoteModel, conditions);

		var completionBool = await modelManager.isModelDownloaded(remoteModel);
		while (!completionBool) {
			sleep(Duration(seconds: 1));
		}
		
		if (await modelManager.isModelDownloaded(remoteModel) == true) {
			File modelFile = await modelManager.getLatestModelFile(remoteModel);

			modelFile ?? print("NOT NULL");

			print(modelFile.path);
			try {
				interpreter = Interpreter.fromFile(modelFile);
			} catch (e) {
				print(e);
			}
		} else {
			print("not done yet");
		}
	}
   
  @override
  Widget build(BuildContext context) {
		_firebaseTest();
    return GestureDetector(
      onHorizontalDragUpdate: (value){
          if(value.primaryDelta > 15.0)
          {
            //print("swipe");
            index++;
          }
          else if(value.primaryDelta < -15.0)
          {
            //print("swipe");
            index--;
          }

          if(index == myListings.data.length)
          {
            index = 0;
          }

          if(index < 0)
          {
            index = myListings.data.length - 1;
          }
          //print(index);
          setState(() {});
      },
      child: Scaffold(
			appBar: AppBar(
				title: Text("Home"),
			),
			body: Container(child: Text("HOME"))
		),
    );
		
	}
}
