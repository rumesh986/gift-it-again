import 'package:http/http.dart';
import 'dart:convert';

class WatsonNLP {
	final String _baseURL = "api.us-south.natural-language-understanding.watson.cloud.ibm.com";
	Client _client;

	WatsonNLP() {
		_client = Client();
	}

	// List<String> 
	Future<List<String>> getTags(String description) async {
		String url = _baseURL + "/v1/analyze\?version=2020-08-01";
		String msg = jsonEncode({
			"text": description,
			"features": {
				"keywords": {
					"sentiment": true
				}
			}
		});

    List<String> obtainedTags = [];

		var response = await _client.post(
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