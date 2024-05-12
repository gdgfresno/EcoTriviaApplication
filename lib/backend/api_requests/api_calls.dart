import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetTriviaCall {
  static Future<ApiCallResponse> call({
    String? sessionID = '',
    String? token = '',
    String? agentID = '',
    String? languageCode = '',
    String? locationID = '',
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "$token",
  "agent_id": "$agentID",
  "session_id": "$sessionID",
  "query": "$prompt",
  "language_code": "$languageCode",
  "location_id": "$locationID",
  "trivia_process": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Trivia',
      apiUrl: 'https://eco-agent-adhzvnnyzq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetResponseCall {
  static Future<ApiCallResponse> call({
    String? sessionID = '',
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "04f02c12-c573-4b35-a56a-a4ab274cd181",
  "agent_id": "e476af80-04b5-4c09-b1ea-09c73cf12c93",
  "session_id": "$sessionID",
  "query": "$prompt",
  "language_code": "en-us",
  "location_id": "us-central1",
  "trivia_process": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Response',
      apiUrl:
          'https://us-central1-duet-ai-roadshow-415022.cloudfunctions.net/eco_agent',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
