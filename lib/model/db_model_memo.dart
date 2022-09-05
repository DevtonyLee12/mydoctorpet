import 'package:cloud_firestore/cloud_firestore.dart';

class Memo {
  late String content;
  late String createdDateString;
  late double ratingPawOne;
  late double ratingPawTwo;
  late String doctorid;
  late double ratingAverage;
  // late DocumentReference? reference;

  Memo(
    this.content,
    this.createdDateString,
    this.ratingPawOne,
    this.ratingPawTwo,
    this.ratingAverage,
    // this.reference,
  );

  Memo.getratingAverage() {
    this.ratingAverage.toString();
  }

  Memo.fromJson(Map<String, dynamic> json) {
    content = json['content'] ?? "";
    print("HELLOfromJson");
    print(json['wdate']);
    createdDateString = json['wdate'] ?? "";
    ratingPawOne = json['ratingPawOne'] ?? "3.3";
    ratingPawTwo = json['ratingPawTwo'] ?? "3.3";
    doctorid = json['doctorid'] ?? "";
    ratingAverage = json['ratingAverage'];
  }

  // Memo.fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
  //     : this.fromJson(snapshot.data(), snapshot.id, snapshot.reference);

  // Memo.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
  //     : this.fromJson(snapshot.data()!, snapshot.id, snapshot.reference);

  Map<String, dynamic>? toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    print("HELLOtoJson");
    print(map['createdDateString']);
    map['wdate'] = createdDateString;
    map['ratingPawOne'] = ratingPawOne;
    map['ratingPawTwo'] = ratingPawTwo;
    map['doctorid'] = doctorid;
    map['ratingAverage'] = ratingAverage;
  }
}
