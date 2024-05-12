// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TriviaPlayStruct extends FFFirebaseStruct {
  TriviaPlayStruct({
    TriviaDefinitionStruct? triviaDefinition,
    int? tries,
    int? basicHintCount,
    int? advancedHintCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _triviaDefinition = triviaDefinition,
        _tries = tries,
        _basicHintCount = basicHintCount,
        _advancedHintCount = advancedHintCount,
        super(firestoreUtilData);

  // "trivia_definition" field.
  TriviaDefinitionStruct? _triviaDefinition;
  TriviaDefinitionStruct get triviaDefinition =>
      _triviaDefinition ?? TriviaDefinitionStruct();
  set triviaDefinition(TriviaDefinitionStruct? val) => _triviaDefinition = val;
  void updateTriviaDefinition(Function(TriviaDefinitionStruct) updateFn) =>
      updateFn(_triviaDefinition ??= TriviaDefinitionStruct());
  bool hasTriviaDefinition() => _triviaDefinition != null;

  // "tries" field.
  int? _tries;
  int get tries => _tries ?? 0;
  set tries(int? val) => _tries = val;
  void incrementTries(int amount) => _tries = tries + amount;
  bool hasTries() => _tries != null;

  // "basic_hint_count" field.
  int? _basicHintCount;
  int get basicHintCount => _basicHintCount ?? 0;
  set basicHintCount(int? val) => _basicHintCount = val;
  void incrementBasicHintCount(int amount) =>
      _basicHintCount = basicHintCount + amount;
  bool hasBasicHintCount() => _basicHintCount != null;

  // "advanced_hint_count" field.
  int? _advancedHintCount;
  int get advancedHintCount => _advancedHintCount ?? 0;
  set advancedHintCount(int? val) => _advancedHintCount = val;
  void incrementAdvancedHintCount(int amount) =>
      _advancedHintCount = advancedHintCount + amount;
  bool hasAdvancedHintCount() => _advancedHintCount != null;

  static TriviaPlayStruct fromMap(Map<String, dynamic> data) =>
      TriviaPlayStruct(
        triviaDefinition:
            TriviaDefinitionStruct.maybeFromMap(data['trivia_definition']),
        tries: castToType<int>(data['tries']),
        basicHintCount: castToType<int>(data['basic_hint_count']),
        advancedHintCount: castToType<int>(data['advanced_hint_count']),
      );

  static TriviaPlayStruct? maybeFromMap(dynamic data) => data is Map
      ? TriviaPlayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'trivia_definition': _triviaDefinition?.toMap(),
        'tries': _tries,
        'basic_hint_count': _basicHintCount,
        'advanced_hint_count': _advancedHintCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'trivia_definition': serializeParam(
          _triviaDefinition,
          ParamType.DataStruct,
        ),
        'tries': serializeParam(
          _tries,
          ParamType.int,
        ),
        'basic_hint_count': serializeParam(
          _basicHintCount,
          ParamType.int,
        ),
        'advanced_hint_count': serializeParam(
          _advancedHintCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static TriviaPlayStruct fromSerializableMap(Map<String, dynamic> data) =>
      TriviaPlayStruct(
        triviaDefinition: deserializeStructParam(
          data['trivia_definition'],
          ParamType.DataStruct,
          false,
          structBuilder: TriviaDefinitionStruct.fromSerializableMap,
        ),
        tries: deserializeParam(
          data['tries'],
          ParamType.int,
          false,
        ),
        basicHintCount: deserializeParam(
          data['basic_hint_count'],
          ParamType.int,
          false,
        ),
        advancedHintCount: deserializeParam(
          data['advanced_hint_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TriviaPlayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TriviaPlayStruct &&
        triviaDefinition == other.triviaDefinition &&
        tries == other.tries &&
        basicHintCount == other.basicHintCount &&
        advancedHintCount == other.advancedHintCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([triviaDefinition, tries, basicHintCount, advancedHintCount]);
}

TriviaPlayStruct createTriviaPlayStruct({
  TriviaDefinitionStruct? triviaDefinition,
  int? tries,
  int? basicHintCount,
  int? advancedHintCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TriviaPlayStruct(
      triviaDefinition: triviaDefinition ??
          (clearUnsetFields ? TriviaDefinitionStruct() : null),
      tries: tries,
      basicHintCount: basicHintCount,
      advancedHintCount: advancedHintCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TriviaPlayStruct? updateTriviaPlayStruct(
  TriviaPlayStruct? triviaPlay, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    triviaPlay
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTriviaPlayStructData(
  Map<String, dynamic> firestoreData,
  TriviaPlayStruct? triviaPlay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (triviaPlay == null) {
    return;
  }
  if (triviaPlay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && triviaPlay.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final triviaPlayData = getTriviaPlayFirestoreData(triviaPlay, forFieldValue);
  final nestedData = triviaPlayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = triviaPlay.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTriviaPlayFirestoreData(
  TriviaPlayStruct? triviaPlay, [
  bool forFieldValue = false,
]) {
  if (triviaPlay == null) {
    return {};
  }
  final firestoreData = mapToFirestore(triviaPlay.toMap());

  // Handle nested data for "trivia_definition" field.
  addTriviaDefinitionStructData(
    firestoreData,
    triviaPlay.hasTriviaDefinition() ? triviaPlay.triviaDefinition : null,
    'trivia_definition',
    forFieldValue,
  );

  // Add any Firestore field values
  triviaPlay.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTriviaPlayListFirestoreData(
  List<TriviaPlayStruct>? triviaPlays,
) =>
    triviaPlays?.map((e) => getTriviaPlayFirestoreData(e, true)).toList() ?? [];
