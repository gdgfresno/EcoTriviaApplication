// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TriviaHintStruct extends FFFirebaseStruct {
  TriviaHintStruct({
    String? hint,
    String? hintType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hint = hint,
        _hintType = hintType,
        super(firestoreUtilData);

  // "hint" field.
  String? _hint;
  String get hint => _hint ?? '';
  set hint(String? val) => _hint = val;
  bool hasHint() => _hint != null;

  // "hint_type" field.
  String? _hintType;
  String get hintType => _hintType ?? '';
  set hintType(String? val) => _hintType = val;
  bool hasHintType() => _hintType != null;

  static TriviaHintStruct fromMap(Map<String, dynamic> data) =>
      TriviaHintStruct(
        hint: data['hint'] as String?,
        hintType: data['hint_type'] as String?,
      );

  static TriviaHintStruct? maybeFromMap(dynamic data) => data is Map
      ? TriviaHintStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'hint': _hint,
        'hint_type': _hintType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hint': serializeParam(
          _hint,
          ParamType.String,
        ),
        'hint_type': serializeParam(
          _hintType,
          ParamType.String,
        ),
      }.withoutNulls;

  static TriviaHintStruct fromSerializableMap(Map<String, dynamic> data) =>
      TriviaHintStruct(
        hint: deserializeParam(
          data['hint'],
          ParamType.String,
          false,
        ),
        hintType: deserializeParam(
          data['hint_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TriviaHintStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TriviaHintStruct &&
        hint == other.hint &&
        hintType == other.hintType;
  }

  @override
  int get hashCode => const ListEquality().hash([hint, hintType]);
}

TriviaHintStruct createTriviaHintStruct({
  String? hint,
  String? hintType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TriviaHintStruct(
      hint: hint,
      hintType: hintType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TriviaHintStruct? updateTriviaHintStruct(
  TriviaHintStruct? triviaHint, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    triviaHint
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTriviaHintStructData(
  Map<String, dynamic> firestoreData,
  TriviaHintStruct? triviaHint,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (triviaHint == null) {
    return;
  }
  if (triviaHint.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && triviaHint.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final triviaHintData = getTriviaHintFirestoreData(triviaHint, forFieldValue);
  final nestedData = triviaHintData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = triviaHint.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTriviaHintFirestoreData(
  TriviaHintStruct? triviaHint, [
  bool forFieldValue = false,
]) {
  if (triviaHint == null) {
    return {};
  }
  final firestoreData = mapToFirestore(triviaHint.toMap());

  // Add any Firestore field values
  triviaHint.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTriviaHintListFirestoreData(
  List<TriviaHintStruct>? triviaHints,
) =>
    triviaHints?.map((e) => getTriviaHintFirestoreData(e, true)).toList() ?? [];
