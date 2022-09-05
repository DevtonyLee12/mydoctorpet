import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalInfo {
  String? doctorid;
  String? phoneNumber;
  String? operationTimeforWeekday;
  String? operationTImeforWeekend;
  String? location;
  DocumentReference? reference;

  HospitalInfo(
      {this.doctorid,
      this.phoneNumber,
      this.operationTimeforWeekday,
      this.operationTImeforWeekend,
      this.location,
      this.reference});

  HospitalInfo.fromJson(
      Map<String, dynamic> json, this.doctorid, this.reference) {
    doctorid = json['doctorid'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    operationTimeforWeekday = json['operationTimeforWeekday'] ?? "";
    operationTImeforWeekend = json['operationTImeforWeekend'] ?? "";
    location = json['location'] ?? "";
  }

  HospitalInfo.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.id, snapshot.reference);

  HospitalInfo.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data()!, snapshot.id, snapshot.reference);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorid'] = doctorid;
    map['phoneNumber'] = phoneNumber;
    map['operationTimeforWeekday'] = operationTimeforWeekday;
    map['operationTImeforWeekend'] = operationTImeforWeekend;
    map[' location'] = location;

    return map;
  }
}
