import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trivia_play_widget.dart' show TriviaPlayWidget;
import 'package:flutter/material.dart';

class TriviaPlayModel extends FlutterFlowModel<TriviaPlayWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Trivia)] action in TriviaPlay widget.
  ApiCallResponse? triviaDefString;
  // Stores action output result for [Custom Action - getTrivia] action in TriviaPlay widget.
  TriviaDefinitionStruct? triviaDefinition;
  // Stores action output result for [Custom Action - reinstateSessionId] action in TriviaPlay widget.
  String? newSessionId;
  // Stores action output result for [Backend Call - API (Get Trivia)] action in TriviaPlay widget.
  ApiCallResponse? triviaDefString2;
  // Stores action output result for [Custom Action - getTrivia] action in TriviaPlay widget.
  TriviaDefinitionStruct? triviaDefinition2;
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Hexasphere Loading',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    }
  }

  @override
  void dispose() {}
}
