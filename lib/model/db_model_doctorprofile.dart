import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_model_memo.dart';

class DoctorProfile {
  late String doctorid;
  late String name;
  late String profileImage;
  late String hospital;
  late String medicalSubject;
  List<Memo>? reviewList; //의사에 할당된 리뷰 리스트
  late double ratingInNaver;
  late double ratingViaReviewExpertise;
  late double ratingViaReviewKind;
  late DocumentReference? reference;

  DoctorProfile(
      {required this.doctorid,
      required this.name,
      required this.profileImage,
      required this.hospital,
      required this.medicalSubject,
      required this.reviewList,
      required this.ratingInNaver,
      required this.ratingViaReviewExpertise,
      required this.ratingViaReviewKind,
      this.reference});

  DoctorProfile.fromJson(
      Map<String, dynamic> json, this.doctorid, this.reference) {
    doctorid = json['doctorid'] ?? "";
    name = json['name'] ?? "";
    profileImage = json['profileImage'] ?? "";
    medicalSubject = json['medicalSubject'] ?? "";

    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print(json);
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print(json['reviewList']);
    if (json['Memo'] != null) {
      reviewList = <Memo>[];
      json['Memo'].forEach((v) {
        reviewList?.add(Memo.fromJson(v));
      });
    }

    // reviewList = json['reviewList'] ?? [];//예시 작성해보
    hospital = json['hospital'] ?? "";
    ratingInNaver = json['ratingInNaver'] ?? 4.5;
    ratingViaReviewExpertise = json['ratingViaReviewExpertise'] ?? 4.5;
    ratingViaReviewKind = json['ratingViaReviewKind'] ?? 3.5;
  }

  DoctorProfile.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.id, snapshot.reference);

  DoctorProfile.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data()!, snapshot.id, snapshot.reference);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorid'] = doctorid;
    map['name'] = name;
    map['profileImage'] = profileImage;
    map['profileImage'] = profileImage;
    map['medicalSubject'] = medicalSubject;
    map['reviewList'] =
        reviewList != null ? reviewList?.map((v) => v.toJson()).toList() : null;

    //  data['message_list'] =
    //       messageList != null ? messageList?.map((v) => v.toJson()).toList() : null;

    map['hospital'] = hospital;
    map['ratingViaReviewExpertise'] = ratingViaReviewExpertise;
    map['ratingViaReviewKind'] = ratingViaReviewKind;

    return map;
  }
}
