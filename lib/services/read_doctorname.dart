import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetdoctorName {
  final String documentId;
  GetdoctorName({required this.documentId});

//   CollectionReference doctorprofile =
//       FirebaseFirestore.instance.collection('doctorprofile');

//   Future<QuerySnapshot> read(String documentId) async {
//     // 내 bucketList 가져오기

//     return doctorprofile.where('doctorid', isEqualTo: documentId).get();
//   }
// }

  @override
  Widget build(BuildContext context) {
    {
      CollectionReference doctorprofile =
          FirebaseFirestore.instance.collection('doctorprofile');

      List<String> doctorsname = [];

      return FutureBuilder<DocumentSnapshot>(
          future: doctorprofile.doc(documentId).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return data['name'];
            }
            return Text('loading...');
          }));
    }
  }
}
