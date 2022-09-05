import 'dart:ffi';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mypet_doctor/model/db_model_doctorprofile.dart';
import 'package:mypet_doctor/services/read_doctorname.dart';
import 'package:mypet_doctor/ui/doc_profile/doc_profile.dart';
import '../../services/service_doctorprofile.dart';
import '../review/review_page.dart';
import 'filter_head.dart';

class docList extends StatefulWidget {
  const docList({Key? key}) : super(key: key);

  @override
  State<docList> createState() => _docList();
}

class _docList extends State<docList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff73e4fd),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Color(0xff00a0c3)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("수의사 찾기",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Filter(),
            SizedBox(height: 10),
            FutureBuilder<List<DoctorProfile>>(
                future: DoctorProfileService().getDotors(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                  // reviewList가 비어있으면,
                  {
                    List<DoctorProfile> doctorInformaion = snapshot.data!;

                    return Expanded(
                        child: ListView.builder(
                      itemCount: doctorInformaion.length,
                      itemBuilder: (context, index) {
                        DoctorProfile doctorinformaions =
                            doctorInformaion[index];

                        doctorinformaions.medicalSubject.contains('응급진료');

                        return Container(
                          height: 70,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DocProfileDetail(
                                        doctorInformations:
                                            doctorInformaion[index])),
                              );
                            }, //현재 리뷰 페이지로 되어 있지만, 의사 및 리뷰 페이지로 이동
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          doctorinformaions.profileImage,
                                        ),
                                        radius: 40.0)),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(children: [
                                              Text(
                                                doctorinformaions.name,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                CupertinoIcons.paw,
                                                size: 18,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 3),
                                              Text("5.0"),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                "(50)",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ])),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Row(children: [
                                                Text(
                                                    doctorinformaions.hospital),
                                                SizedBox(width: 15),
                                                Icon(
                                                  CupertinoIcons.star_fill,
                                                  size: 14,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(width: 3),
                                                Text(doctorinformaions
                                                    .ratingInNaver
                                                    .toString()),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "(50)",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ]),
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 60,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff3f1de),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Text(doctorinformaions
                                                      .medicalSubject),
                                                ),
                                                SizedBox(width: 25),
                                                doctorinformaions.medicalSubject
                                                        .contains('응급진료')
                                                    //컨텐인 함수,, 문자열이 포함 되어 있으면
                                                    ? Container(
                                                        width: 90,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffff8888),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: Text(
                                                          "응급진료 가능",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ))
                                                    : Text("")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ));
                  }
                  return Text("리스트가 없습니다.");
                })
          ])),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(DoctorProfileService().getDotors());
      // }
      // )
    );
  }
}
