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

import 'dart:convert';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<TriviaDefinitionStruct> getTrivia(String triviaDefinitionString) async {
  debugPrint(triviaDefinitionString);

  var decodeSucceeded = false;
  Map<String, dynamic> decodedJSON = Map<String, dynamic>();
  final fixTries = ["", '..."}]}', "}]}", "]}", "}"];
  for (final fixTry in fixTries) {
    final triviaDefStr = triviaDefinitionString + fixTry;
    try {
      decodedJSON = json.decode(triviaDefStr) as Map<String, dynamic>;
      decodeSucceeded = true;
      break;
    } on FormatException catch (e) {
      debugPrint("Second try");
    }
  }
  debugPrint('Decoding: $decodeSucceeded');

  final appState = FFAppState();
  appState.triviaPlay.tries = 0;
  appState.triviaPlay.basicHintCount = 0;
  appState.triviaPlay.advancedHintCount = 0;

  final triviaDefinition = TriviaDefinitionStruct();
  triviaDefinition.question =
      decodedJSON.containsKey("question") ? decodedJSON["question"] : "";
  if (decodedJSON.containsKey("choices")) {
    triviaDefinition.choices = [];
    for (final choice in decodedJSON["choices"]) {
      final triviaChoice = TriviaChoiceStruct();
      triviaChoice.choice =
          choice.containsKey("choice") ? choice["choice"] : "";
      triviaChoice.correct =
          choice.containsKey("correct") ? choice["correct"] : false;
      triviaDefinition.choices.add(triviaChoice);
    }
  }

  if (decodedJSON.containsKey("hints")) {
    triviaDefinition.hints = [];
    for (final hint in decodedJSON["hints"]) {
      final triviaHint = TriviaHintStruct();
      triviaHint.hint = hint.containsKey("hint") ? hint["hint"] : "";
      triviaHint.hintType =
          hint.containsKey("hint_type") ? hint["hint_type"] : "";
      triviaDefinition.hints.add(triviaHint);
    }
  }

  return triviaDefinition;
}
