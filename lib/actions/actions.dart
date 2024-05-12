import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/victory_modal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future choiceHandling(
  BuildContext context, {
  int? choiceIndex,
}) async {
  bool? triviaSolved;
  TriviaPlayStruct? emptyPlay;

  triviaSolved = await actions.evaluateChoice(
    choiceIndex!,
  );
  if (triviaSolved == true) {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: VictoryModalWidget(),
          ),
        );
      },
    );

    emptyPlay = await actions.getEmptyTriviaPlay();
    FFAppState().triviaPlay = emptyPlay;
    FFAppState().inTrivia = false;
    context.safePop();
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Retry'),
          content: const Text('Consider invoking any of the four hints'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

Future retrieveAndShowHint(
  BuildContext context, {
  int? hintIndex,
  String? title,
}) async {
  String? hintText;

  hintText = await actions.getHint(
    hintIndex!,
  );
  if (hintText != '') {
    await actions.updateHintCount(
      hintIndex,
    );
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text(title!),
          content: Text(hintText!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Dismiss'),
            ),
          ],
        );
      },
    );
    FFAppState().update(() {});
  } else {
    return;
  }
}
