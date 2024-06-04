import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'trivia_play_model.dart';
export 'trivia_play_model.dart';

class TriviaPlayWidget extends StatefulWidget {
  const TriviaPlayWidget({super.key});

  @override
  State<TriviaPlayWidget> createState() => _TriviaPlayWidgetState();
}

class _TriviaPlayWidgetState extends State<TriviaPlayWidget> {
  late TriviaPlayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TriviaPlayModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().inTrivia) {
        return;
      }

      _model.triviaDefString = await GetTriviaCall.call(
        token: FFAppConstants.apiToken,
        agentID: FFAppConstants.agentID,
        locationID: FFAppConstants.locationID,
        languageCode: FFAppConstants.languageCode,
        sessionID: FFAppState().sessionId,
        prompt: FFAppConstants.prompt,
      );
      if ((_model.triviaDefString?.succeeded ?? true)) {
        _model.triviaDefinition = await actions.getTrivia(
          (_model.triviaDefString?.bodyText ?? ''),
        );
        FFAppState().updateTriviaPlayStruct(
          (e) => e..triviaDefinition = _model.triviaDefinition,
        );
        FFAppState().inTrivia = true;
        setState(() {});
      } else {
        _model.newSessionId = await actions.reinstateSessionId();
        if (_model.newSessionId != null && _model.newSessionId != '') {
          _model.triviaDefString2 = await GetTriviaCall.call(
            token: FFAppConstants.apiToken,
            agentID: FFAppConstants.agentID,
            locationID: FFAppConstants.locationID,
            languageCode: FFAppConstants.languageCode,
            sessionID: _model.newSessionId,
            prompt: FFAppConstants.prompt,
          );
          if ((_model.triviaDefString2?.succeeded ?? true)) {
            _model.triviaDefinition2 = await actions.getTrivia(
              (_model.triviaDefString2?.bodyText ?? ''),
            );
            FFAppState().updateTriviaPlayStruct(
              (e) => e..triviaDefinition = _model.triviaDefinition2,
            );
            FFAppState().inTrivia = true;
            setState(() {});
          } else {
            return;
          }

          return;
        } else {
          return;
        }
      }

      return;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.safePop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        title: Text(
          'Trivia',
          style: FlutterFlowTheme.of(context).headlineLarge.override(
                fontFamily: 'Urbanist',
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().inTrivia == true)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFAppState().triviaPlay.triviaDefinition.question,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Divider(
                              height: 30.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await action_blocks.choiceHandling(
                                      context,
                                      choiceIndex: 0,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            1.0,
                                            3.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Text(
                                        FFAppState()
                                            .triviaPlay
                                            .triviaDefinition
                                            .choices
                                            .first
                                            .choice
                                            .maybeHandleOverflow(
                                              maxChars: 1024,
                                              replacement: '…',
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 50,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await action_blocks.choiceHandling(
                                      context,
                                      choiceIndex: 1,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            1.0,
                                            3.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Text(
                                        FFAppState()
                                            .triviaPlay
                                            .triviaDefinition
                                            .choices[1]
                                            .choice
                                            .maybeHandleOverflow(
                                              maxChars: 1024,
                                              replacement: '…',
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 50,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await action_blocks.choiceHandling(
                                      context,
                                      choiceIndex: 2,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            1.0,
                                            3.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Text(
                                        FFAppState()
                                            .triviaPlay
                                            .triviaDefinition
                                            .choices[2]
                                            .choice
                                            .maybeHandleOverflow(
                                              maxChars: 1024,
                                              replacement: '…',
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 50,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await action_blocks.choiceHandling(
                                      context,
                                      choiceIndex: 3,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            1.0,
                                            3.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Text(
                                        FFAppState()
                                            .triviaPlay
                                            .triviaDefinition
                                            .choices[3]
                                            .choice
                                            .maybeHandleOverflow(
                                              maxChars: 1024,
                                              replacement: '…',
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 50,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 15.0)),
                            ),
                            Divider(
                              height: 30.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await action_blocks.retrieveAndShowHint(
                                        context,
                                        hintIndex: 0,
                                        title: 'Hint',
                                      );
                                    },
                                    text: 'Hint #1',
                                    icon: const Icon(
                                      Icons.question_mark,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await action_blocks.retrieveAndShowHint(
                                        context,
                                        hintIndex: 1,
                                        title: 'Specific Hint',
                                      );
                                    },
                                    text: 'Hint #2',
                                    icon: const Icon(
                                      Icons.help,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await action_blocks.retrieveAndShowHint(
                                        context,
                                        hintIndex: 2,
                                        title: 'Source',
                                      );
                                    },
                                    text: 'Source',
                                    icon: const Icon(
                                      Icons.live_help,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await action_blocks.retrieveAndShowHint(
                                        context,
                                        hintIndex: 3,
                                        title: 'Source Part',
                                      );
                                    },
                                    text: 'Src Hint',
                                    icon: const Icon(
                                      Icons.live_help,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 30.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().inTrivia != true)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SizedBox(
                          width: 300.0,
                          height: 300.0,
                          child: RiveAnimation.asset(
                            'assets/rive_animations/hexasphere_loading_animation.riv',
                            artboard: 'Hexasphere Animation',
                            fit: BoxFit.contain,
                            controllers: _model.riveAnimationControllers,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
