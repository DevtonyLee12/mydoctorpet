import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mypet_doctor/model/db_model_doctorprofile.dart';
import 'package:mypet_doctor/ui/doc_list/doc_list_page.dart';
import 'package:mypet_doctor/ui/review/review_page.dart';

import '../model/db_model_memo.dart';

class DoctorProfileService extends ChangeNotifier {
  // static final DoctorProfileService _doctorService =
  //     DoctorProfileService._internal();

  // factory DoctorProfileService({Key? key}) => _doctorService;
  // DoctorProfileService._internal();

  // Future createNewDoctor(Map<String, dynamic> json, String doctorid) async {
  //   DocumentReference<Map<String, dynamic>> documentReference =
  //       FirebaseFirestore.instance.collection('doctorprofile').doc(doctorid);
  //   final DocumentSnapshot documentSnapshot = await documentReference.get();

  //   if (!documentSnapshot.exists) {
  //     await documentReference.set(json);
  //   }
  // }

  Future<DoctorProfile> getDoctor(String doctorid) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('doctorprofile').doc(doctorid);

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();

    DoctorProfile doctorProfile = DoctorProfile.fromSnapshot(documentSnapshot);

    return doctorProfile;
  }

  Future<List<DoctorProfile>> getDotors() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('doctorprofile');
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await collectionReference.get();

    List<DoctorProfile> doctorInformation = [];

    for (int i = 0; i < snapshots.size; i++) {
      DoctorProfile doctorProfile =
          DoctorProfile.fromQuerySnapshot(snapshots.docs[i]);
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
