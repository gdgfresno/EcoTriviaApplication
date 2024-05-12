import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _inTrivia = false;
  bool get inTrivia => _inTrivia;
  set inTrivia(bool value) {
    _inTrivia = value;
  }

  TriviaPlayStruct _triviaPlay = TriviaPlayStruct.fromSerializableMap(
      jsonDecode('{\"trivia_definition\":\"{\\\"choices\\\":\\\"[]\\\"}\"}'));
  TriviaPlayStruct get triviaPlay => _triviaPlay;
  set triviaPlay(TriviaPlayStruct value) {
    _triviaPlay = value;
  }

  void updateTriviaPlayStruct(Function(TriviaPlayStruct) updateFn) {
    updateFn(_triviaPlay);
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String value) {
    _sessionId = value;
  }
}
