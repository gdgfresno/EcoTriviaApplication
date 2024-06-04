// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import '/auth/firebase_auth/auth_util.dart' as auth_util;
import 'package:uuid/uuid.dart';

Future<String> reinstateSessionId() async {
  final userRecord = auth_util.currentUserDocument;
  if (userRecord == null) {
    return "";
  }

  var updateData = Map<String, dynamic>();
  final sessionId = Uuid().v4();
  updateData["session_id"] = sessionId;
  FFAppState().sessionId = sessionId;

  await userRecord.reference.update(updateData);

  return sessionId;
}
