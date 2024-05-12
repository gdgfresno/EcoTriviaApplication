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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
String getHintType(int hintIndex) {
  switch (hintIndex) {
    case 0:
      return "basic";
    case 1:
      return "specific";
    case 2:
      return "source";
    case 3:
    default:
      return "source_part";
  }
}

Future<String> getHint(int hintIndex) async {
  String hintText = "";
  final appState = FFAppState();
  final hintType = getHintType(hintIndex);
  for (final hint in appState.triviaPlay.triviaDefinition.hints) {
    if (hint.hintType == hintType) {
      hintText = hint.hint;
      break;
    }
  }

  return hintText;
}
