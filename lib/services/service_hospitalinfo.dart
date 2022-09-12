import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/db_model_hospitalinfo.dart';
import '../model/db_model_memo.dart';

class HospitalInfoService extends ChangeNotifier {
  Future<HospitalInfo> getHospital(String doctorid) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('doctorprofile').doc(doctorid);

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();

    HospitalInfo doctorProfile = HospitalInfo.fromSnapshot(documentSnapshot);

    return doctorProfile;
  }

  Future<List<HospitalInfo>> getDotors() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('doctorprofile');
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await collectionReference.get();

    List<HospitalInfo> doctorInformation = [];

    for (int i = 0; i < snapshots.size; i++) {
      HospitalInfo doctorProfile =
          HospitalInfo.fromQuerySnapshot(snapshots.docs[i]);
      doctorInformation.add(doctorProfile);
    }
    print(doctorInformation);
    return doctorInformation;
  }

  Future<List<Memo>> getReviews(String doctorId) async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance
            .collection('doctorprofile')
            .doc(doctorId)
            .collection("reviewList");

    QuerySnapshot<Map<String, dynamic>> snapshots =
        await collectionReference.get();

    List<Memo> doctorInformationReview = [];

    for (int i = 0; i < snapshots.size; i++) {
      Memo doctorInformationReviews = Memo.fromJson(snapshots.docs[i].data());
      doctorInformationReview.add(doctorInformationReviews);
    }
    print(doctorInformationReview);
    return doctorInformationReview;
  }
}
