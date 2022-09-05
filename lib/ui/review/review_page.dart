import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:mypet_doctor/function/rating_function/ratingpawone.dart';
import 'package:intl/intl.dart';
import 'package:mypet_doctor/function/rating_function/ratingpawtwo.dart';
import 'package:mypet_doctor/model/db_model_doctorprofile.dart';

import '../../model/db_model_memo.dart';

void _insertMemo(Memo memo, DoctorProfile doctorInformations) {
  memo.ratingAverage = (memo.ratingPawTwo + memo.ratingPawOne) / 2;
  FirebaseFirestore.instance
      .collection("doctorprofile")
      .doc(doctorInformations.doctorid)
      .collection("reviewList")
      .add({
    'content': memo.content,
    'wdate': memo.createdDateString,
    'ratingPawOne': memo.ratingPawOne,
    'ratingPawTwo': memo.ratingPawTwo,
    'ratingAverage': memo.ratingAverage,
  });
  // .add(memo.toJson()!);
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({
    Key? key,
    required this.doctorInformations,
  }) : super(key: key);
  final DoctorProfile doctorInformations;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

double _currentIndexone = 0;
double _currentIndextwo = 0;
double _ratingAverage = 0;

class _ReviewPageState extends State<ReviewPage> {
  final _reviewPageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // textform외 다른 데 터치시 텍스트필드 내리기
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false, // textfiled 입력시 overflow 막아줌
          appBar: AppBar(
            backgroundColor: Color(0xff73e4fd),
            leading: IconButton(
              icon: Icon(CupertinoIcons.back, color: Color(0xff00a0c3)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text("리뷰 작성",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "진료는 어떠셨나요?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "전문성",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Spacer(),
                                RatingBar.builder(
                                  itemSize: 20.0,
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  updateOnDrag: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                      CupertinoIcons.paw,
                                      color: Color(0xff00A0C3)),
                                  onRatingUpdate: (rating) {
                                    _currentIndexone = rating;
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "친절도",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Spacer(),
                                RatingBar.builder(
                                  itemSize: 20.0,
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  updateOnDrag: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                      CupertinoIcons.paw,
                                      color: Color(0xff00A0C3)),
                                  onRatingUpdate: (rating) {
                                    _currentIndextwo = rating;
                                  },
                                )
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(color: Color(0xffEDFCFF)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: _reviewPageController,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    '진료받은 서비스에 대해 전문성, 친절도 등 솔직한 리뷰를 상세히 남겨주세요! '),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    // 작성 완료 버튼
                    Container(
                      color: Color(0xff00A0C3),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final now = DateTime.now().toString();
                              DateTime createdDate = DateTime.parse(now);
                              String createdDateString = DateFormat.yMd('en_US')
                                  .add_jm()
                                  .format(createdDate);

                              var memo = Memo(
                                  _reviewPageController.text,
                                  createdDateString,
                                  _currentIndexone,
                                  _currentIndextwo,
                                  _ratingAverage);

                              _reviewPageController.text.isEmpty
                                  ? showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("확인"))
                                          ],
                                          title: Text(
                                            "리뷰가 작성되지 않았습니다!",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        );
                                      })
                                  : Navigator.pop(context, memo);
                              _insertMemo(memo, widget.doctorInformations);
                            });
                          },
                          child: Text(
                            "작성 완료",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          )),
                    )
                  ])),
        ));
  }
}
