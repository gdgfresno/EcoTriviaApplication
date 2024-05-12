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

import '/auth/firebase_auth/auth_util.dart' as auth_util;

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<bool> evaluateChoice(int choiceIndex) async {
  final appState = FFAppState();

  if (!appState.triviaPlay.triviaDefinition.choices[choiceIndex].correct) {
    appState.triviaPlay.tries += 1;
    return false;
  }

  var score = 100 -
      appState.triviaPlay.basicHintCount * 10 -
      appState.triviaPlay.advancedHintCount * 20 -
      appState.triviaPlay.tries * 10;

  final userRecord = auth_util.currentUserDocument;
  if (userRecord != null) {
    Map<String, int> updateData = {
      "xp": userRecord.xp + score,
      "level": userRecord.level + 1
    };
    userRecord.reference.update(updateData);

    final historyRef = userRecord.reference.collection("history");
    await historyRef.add(appState.triviaPlay.toMap());
  }

  return true;
}
