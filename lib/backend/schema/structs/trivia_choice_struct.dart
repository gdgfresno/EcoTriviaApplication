// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TriviaChoiceStruct extends FFFirebaseStruct {
  TriviaChoiceStruct({
    String? choice,
    bool? correct,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _choice = choice,
        _correct = correct,
        super(firestoreUtilData);

  // "choice" field.
  String? _choice;
  String get choice => _choice ?? '';
  set choice(String? val) => _choice = val;
  bool hasChoice() => _choice != null;

  // "correct" field.
  bool? _correct;
  bool get correct => _correct ?? false;
  set correct(bool? val) => _correct = val;
  bool hasCorrect() => _correct != null;

  static TriviaChoiceStruct fromMap(Map<String, dynamic> data) =>
      TriviaChoiceStruct(
        choice: data['choice'] as String?,
        correct: data['correct'] as bool?,
      );

  static TriviaChoiceStruct? maybeFromMap(dynamic data) => data is Map
      ? TriviaChoiceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'choice': _choice,
        'correct': _correct,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'choice': serializeParam(
          _choice,
          ParamType.String,
        ),
        'correct': serializeParam(
          _correct,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TriviaChoiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      TriviaChoiceStruct(
        choice: deserializeParam(
          data['choice'],
          ParamType.String,
          false,
        ),
        correct: deserializeParam(
          data['correct'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TriviaChoiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TriviaChoiceStruct &&
        choice == other.choice &&
        correct == other.correct;
  }

  @override
  int get hashCode => const ListEquality().hash([choice, correct]);
}

TriviaChoiceStruct createTriviaChoiceStruct({
  String? choice,
  bool? correct,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TriviaChoiceStruct(
      choice: choice,
      correct: correct,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TriviaChoiceStruct? updateTriviaChoiceStruct(
  TriviaChoiceStruct? triviaChoice, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    triviaChoice
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTriviaChoiceStructData(
  Map<String, dynamic> firestoreData,
  TriviaChoiceStruct? triviaChoice,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (triviaChoice == null) {
    return;
  }
  if (triviaChoice.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && triviaChoice.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final triviaChoiceData =
      getTriviaChoiceFirestoreData(triviaChoice, forFieldValue);
  final nestedData =
      triviaChoiceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = triviaChoice.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTriviaChoiceFirestoreData(
  TriviaChoiceStruct? triviaChoice, [
  bool forFieldValue = false,
]) {
  if (triviaChoice == null) {
    return {};
  }
  final firestoreData = mapToFirestore(triviaChoice.toMap());

  // Add any Firestore field values
  triviaChoice.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTriviaChoiceListFirestoreData(
  List<TriviaChoiceStruct>? triviaChoices,
) =>
    triviaChoices?.map((e) => getTriviaChoiceFirestoreData(e, true)).toList() ??
    [];
