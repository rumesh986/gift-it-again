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

import 'package:http/http.dart';
import 'dart:convert';

class WatsonNLP {
	final String _baseURL = "api.us-south.natural-language-understanding.watson.cloud.ibm.com";
	Client _client;

	WatsonNLP() {
		_client = Client();
	}

	Future<List<String>> getTags(String description) async {
		String msg = jsonEncode({
			"text": description,
			"features": {
				"keywords": {
					"sentiment": true
				}
			}
		});

    List<String> obtainedTags = [];

		await _client.post(
			Uri.https(
				_baseURL, 
        "/v1/analyze",
				{
					"version": "2020-08-01"
				}
			), headers: {
				"Content-Type": "application/json",
				"Authorization": "Basic YXBpa2V5Okh1RzVBSjBrVVQ4elVKSFEwUEVpS1Zia0dwdEU3a0FOelotNW9YcF9CU2s4"
			}, body: msg
		).then((resp) {
      jsonDecode(resp.body)["keywords"].forEach((element) => obtainedTags.add(element["text"]));
      print(obtainedTags);
		});
    return obtainedTags;
	}
}