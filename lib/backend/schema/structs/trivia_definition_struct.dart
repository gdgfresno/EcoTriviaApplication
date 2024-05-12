// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TriviaDefinitionStruct extends FFFirebaseStruct {
  TriviaDefinitionStruct({
    String? question,
    List<TriviaChoiceStruct>? choices,
    List<TriviaHintStruct>? hints,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _choices = choices,
        _hints = hints,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "choices" field.
  List<TriviaChoiceStruct>? _choices;
  List<TriviaChoiceStruct> get choices => _choices ?? const [];
  set choices(List<TriviaChoiceStruct>? val) => _choices = val;
  void updateChoices(Function(List<TriviaChoiceStruct>) updateFn) =>
      updateFn(_choices ??= []);
  bool hasChoices() => _choices != null;

  // "hints" field.
  List<TriviaHintStruct>? _hints;
  List<TriviaHintStruct> get hints => _hints ?? const [];
  set hints(List<TriviaHintStruct>? val) => _hints = val;
  void updateHints(Function(List<TriviaHintStruct>) updateFn) =>
      updateFn(_hints ??= []);
  bool hasHints() => _hints != null;

  static TriviaDefinitionStruct fromMap(Map<String, dynamic> data) =>
      TriviaDefinitionStruct(
        question: data['question'] as String?,
        choices: getStructList(
          data['choices'],
          TriviaChoiceStruct.fromMap,
        ),
        hints: getStructList(
          data['hints'],
          TriviaHintStruct.fromMap,
        ),
      );

  static TriviaDefinitionStruct? maybeFromMap(dynamic data) => data is Map
      ? TriviaDefinitionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'choices': _choices?.map((e) => e.toMap()).toList(),
        'hints': _hints?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'choices': serializeParam(
          _choices,
          ParamType.DataStruct,
          true,
        ),
        'hints': serializeParam(
          _hints,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TriviaDefinitionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TriviaDefinitionStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        choices: deserializeStructParam<TriviaChoiceStruct>(
          data['choices'],
          ParamType.DataStruct,
          true,
          structBuilder: TriviaChoiceStruct.fromSerializableMap,
        ),
        hints: deserializeStructParam<TriviaHintStruct>(
          data['hints'],
          ParamType.DataStruct,
          true,
          structBuilder: TriviaHintStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TriviaDefinitionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TriviaDefinitionStruct &&
        question == other.question &&
        listEquality.equals(choices, other.choices) &&
        listEquality.equals(hints, other.hints);
  }

  @override
  int get hashCode => const ListEquality().hash([question, choices, hints]);
}

TriviaDefinitionStruct createTriviaDefinitionStruct({
  String? question,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TriviaDefinitionStruct(
      question: question,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TriviaDefinitionStruct? updateTriviaDefinitionStruct(
  TriviaDefinitionStruct? triviaDefinition, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    triviaDefinition
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTriviaDefinitionStructData(
  Map<String, dynamic> firestoreData,
  TriviaDefinitionStruct? triviaDefinition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (triviaDefinition == null) {
    return;
  }
  if (triviaDefinition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && triviaDefinition.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final triviaDefinitionData =
      getTriviaDefinitionFirestoreData(triviaDefinition, forFieldValue);
  final nestedData =
      triviaDefinitionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = triviaDefinition.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTriviaDefinitionFirestoreData(
  TriviaDefinitionStruct? triviaDefinition, [
  bool forFieldValue = false,
]) {
  if (triviaDefinition == null) {
    return {};
  }
  final firestoreData = mapToFirestore(triviaDefinition.toMap());

  // Add any Firestore field values
  triviaDefinition.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTriviaDefinitionListFirestoreData(
  List<TriviaDefinitionStruct>? triviaDefinitions,
) =>
    triviaDefinitions
        ?.map((e) => getTriviaDefinitionFirestoreData(e, true))
        .toList() ??
    [];
