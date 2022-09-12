import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mypet_doctor/function/rating_function/ratingpawone.dart';
import 'package:mypet_doctor/function/rating_function/ratingpawtwo.dart';
import 'package:mypet_doctor/model/db_model_doctorprofile.dart';
import 'package:mypet_doctor/ui/doc_list/doc_list_page.dart';
import 'package:mypet_doctor/ui/review/review_page.dart';
import 'dart:math';

import '../review/widget_review.dart';
import '../review/widget_review.dart';
import '../../model/db_model_memo.dart';
import '../../services/service_doctorprofile.dart';
import '../review/review_page.dart';

class DocProfileDetail extends StatefulWidget {
  DocProfileDetail({Key? key, required this.doctorInformations})
      : super(key: key);

  final DoctorProfile doctorInformations;
  double averageRound = 0.0;

  @override
  State<DocProfileDetail> createState() => _DocProfileDetail();
}

class _DocProfileDetail extends State<DocProfileDetail>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override

  // fireBaseTime = snapshot.data.docs[index]['wdate']

  // DateTime createDate = DateTime.parse();

  // 탭뷰의 상태변화를 업데이트 하는 영역
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      // 주치의 프로필 이미지 영역
      Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                widget.doctorInformations.profileImage,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: Color.fromARGB(255, 145, 180, 197),
                    size: 30,
                  ),
                ),
                Text(
                  "(204)",
                  style: TextStyle(color: Color.fromARGB(255, 131, 174, 210)),
                )
              ],
            ),
          ),
        ],
      ),

      // 주치의 이름 영역
      Text(
        widget.doctorInformations.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),

      // 진료과목 카테고리 영역
      Padding(
        padding: const EdgeInsets.all(0.3),
        child: Container(
          // color: Color.fromARGB(255, 29, 143, 143),
          width: 200,
          height: 30,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: rossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(33, 25, 103, 103),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        widget.doctorInformations.medicalSubject,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(33, 25, 103, 103),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "진료과목",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(33, 25, 103, 103),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "진료과목",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //동물병원이름, 네이버 평점 영역
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Container(
          // color: Color.fromARGB(255, 185, 29, 29),

          width: 160,
          height: 20,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    widget.doctorInformations.hospital,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    CupertinoIcons.star_fill,
                    size: 15,
                    color: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "4.3",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // 주치의 평점 영역 (파란색 컨테이너 박스 안)
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 224, 239, 247),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.paw,
                          size: 25,
                          color: Color.fromRGBO(59, 107, 164, 1),
                        ),
                        Text(
                          "4.6",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "전문성",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "친절도",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                                Icon(
                                  CupertinoIcons.paw,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // 탭바 영역
      Container(
        child: TabBar(
          tabs: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "병원정보",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "리뷰",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          labelColor: Color.fromARGB(251, 7, 7, 7),
          unselectedLabelColor: Colors.black,
          controller: tabController,
        ),
      ),

      // 탭바 콘텐츠 영역
      Container(
        height: 500,
        child: TabBarView(
          controller: tabController,
          children: [
            // 병원 정보 영역
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 255, 253, 253),
                        child: Text(
                          "진료시간",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 252, 249, 210)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("평일",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "10:00 ~ 19:00",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Text(
                                    "(점심시간 12:30 ~ 14:00)",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 252, 249, 210)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("주말 / 공휴일",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "10:00 ~ 19:00",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Text(
                                    "(점심시간 12:30 ~ 14:00)",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "연락처 : 02-418-0724",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    color: Color.fromARGB(255, 249, 247, 247),
                    child: Text(
                      "주소 : 서울 송파구 올림픽로 76 J타워 1, 2층",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('doctorprofile')
                    .doc(widget.doctorInformations.doctorid)
                    .collection('reviewList')
                    .orderBy('wdate', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>>?
                      doctorReviews = snapshot.data?.docs;
                  List<Memo> memoList = [];
                  doctorReviews?.forEach(
                      (QueryDocumentSnapshot<Map<String, dynamic>> element) {
                    memoList.add(Memo.fromJson(element.data()));
                  });

                  if (doctorReviews == null) {
                    return Container(
                      alignment: Alignment(0.0, -0.7),
                      decoration: BoxDecoration(),
                      height: 1,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "첫 리뷰를 남겨주세요",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(CupertinoIcons.paw)
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemBuilder: (context, index) => ReviewWidget(
                      review: memoList[index],
                    ),
                    itemCount: doctorReviews.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 3),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ReviewPage(
                      doctorInformations: widget.doctorInformations)),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xff00A0C3),
            minimumSize: Size(200, 60),
            // shape: RoundedRectangleBorder(
            //     // shape : 버튼의 모양을 디자인 하는 기능
            //     borderRadius: BorderRadius.circular(25.0)),
            // maximumSize: Size(100, 50),
          ),
          child: Text(
            "리뷰 작성",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: Color.fromRGBO(59, 107, 164, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.doctorInformations.name,
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Color.fromRGBO(130, 187, 255, 1),
      ),
      body: ListView(
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          children: children2),
    );
  }
}
