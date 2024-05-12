import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "trivia_play" field.
  TriviaPlayStruct? _triviaPlay;
  TriviaPlayStruct get triviaPlay => _triviaPlay ?? TriviaPlayStruct();
  bool hasTriviaPlay() => _triviaPlay != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _triviaPlay = TriviaPlayStruct.maybeFromMap(snapshotData['trivia_play']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('history')
          : FirebaseFirestore.instance.collectionGroup('history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('history').doc(id);

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  DocumentReference? owner,
  DateTime? timeCreated,
  TriviaPlayStruct? triviaPlay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'time_created': timeCreated,
      'trivia_play': TriviaPlayStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "trivia_play" field.
  addTriviaPlayStructData(firestoreData, triviaPlay, 'trivia_play');

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.triviaPlay == e2?.triviaPlay;
  }

  @override
  int hash(HistoryRecord? e) =>
      const ListEquality().hash([e?.owner, e?.timeCreated, e?.triviaPlay]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
