import 'package:firebase_ml_custom/firebase_ml_custom.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:io';

class FireBaseML {
	Interpreter interpreter;

	FireBaseML() {
		_init();
	}

	void _init() async{
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

	List<dynamic> runModel(List<dynamic> input) {
		interpreter ??  _init();
		List output = List.filled(10,0);

		interpreter?.run(input, output);
		return output;
	}
}