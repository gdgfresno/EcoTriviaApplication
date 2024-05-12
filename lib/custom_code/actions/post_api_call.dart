// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

// https://community.flutterflow.io/database-and-apis/post/calling-api-from-custom-action-O8ircLkC9PJsMeJ
Future<dynamic> postApiCall(String apiUrl, String token, String locationId,
    String agentId, String sessionId, String languageCode) async {
  // Request Body
  var requestBody = json.encode({
    "token": token,
    "agent_id": agentId,
    "session_id": sessionId,
    "query":
        "Come up with a unique trivia about sustainability or any sustainable development goal",
    "language_code": languageCode,
    "location_id": locationId,
  });

  var url = Uri.parse(apiUrl);

  // Headers
  // https://developer.chrome.com/blog/referrer-policy-new-chrome-default
  var headers = {
    'Content-Type': 'application/json',
    'Referrer-Policy': 'no-referrer-when-downgrade'
  };

  // Making POST request
  try {
    var response = await http.post(url, headers: headers, body: requestBody);

    // Handling the response
    if (response.statusCode == 200) {
      var resultResponse = json.decode(response.body);

      return resultResponse;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
