import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypet_doctor/model/db_model_doctorprofile.dart';
import 'package:mypet_doctor/ui/doc_profile/doc_profile.dart';
import '../../services/service_doctorprofile.dart';
import '../home/widget_bottom_navigation_bar/bottom_navi.dart';
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
        backgroundColor: Color.fromRGBO(130, 187, 255, 1),
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: Color.fromRGBO(59, 107, 164, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "수의사 찾기",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Filter(),
            // SizedBox(height: 10),
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
                      DoctorProfile doctorinformaions = doctorInformaion[index];

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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              CupertinoIcons.paw,
                                              size: 18,
                                              color: Color.fromRGBO(
                                                  59, 107, 164, 1),
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
                                              Text(doctorinformaions.hospital),
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
                                                style: TextStyle(fontSize: 12),
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
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Text(
                                                  doctorinformaions
                                                      .medicalSubject,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                              SizedBox(width: 25),
                                              doctorinformaions.medicalSubject
                                                      .contains('응급진료')
                                                  //컨텐인 함수,, 문자열이 포함 되어 있으면
                                                  ? Container(
                                                      width: 90,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffff8888),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Text(
                                                        "응급진료 가능",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
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
                return Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Text(
                      "리스트가 없습니다.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
