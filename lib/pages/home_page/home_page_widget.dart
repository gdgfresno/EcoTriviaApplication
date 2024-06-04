import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.success = await actions.initializeVariables();
      if (!_model.success!) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Init'),
              content: const Text('No bueno'),
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
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Image.asset(
                    'assets/images/Runway_Expand_Image~1280_masked.jpg',
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Runway_Expand_Image~Rotor_cut.png',
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.27,
                      fit: BoxFit.contain,
                      alignment: const Alignment(0.05, 0.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AlignedTooltip(
                    content: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Experience Points',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    offset: 4.0,
                    preferredDirection: AxisDirection.down,
                    borderRadius: BorderRadius.circular(8.0),
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 4.0,
                    tailBaseWidth: 24.0,
                    tailLength: 12.0,
                    waitDuration: const Duration(milliseconds: 100),
                    showDuration: const Duration(milliseconds: 1500),
                    triggerMode: TooltipTriggerMode.tap,
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        'XP: ${valueOrDefault(currentUserDocument?.xp, 0).toString()}',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  AlignedTooltip(
                    content: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Level',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    offset: 4.0,
                    preferredDirection: AxisDirection.down,
                    borderRadius: BorderRadius.circular(8.0),
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 4.0,
                    tailBaseWidth: 24.0,
                    tailLength: 12.0,
                    waitDuration: const Duration(milliseconds: 100),
                    showDuration: const Duration(milliseconds: 1500),
                    triggerMode: TooltipTriggerMode.tap,
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        'Lvl: ${valueOrDefault(currentUserDocument?.level, 0).toString()}',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 30.0,
                    thickness: 0.5,
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'TriviaPlay',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        },
                        text: 'Trivia',
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 28.0,
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 28.0,
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
                          context.pushNamed(
                            'chat_ai_Screen',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        },
                        text: 'Oracle',
                        icon: const Icon(
                          Icons.chat_bubble,
                          size: 28.0,
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 28.0,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
