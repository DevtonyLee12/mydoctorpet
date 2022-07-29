// 리뷰
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mypet_doctor/function/rating_function/ratingStar.dart';

class Memo {
  String? content;
  String? wdate;

  Memo(this.content, this.wdate);
}

void _insertMemo(Memo memo) {
  FirebaseFirestore.instance
      .collection("memos")
      .add({'content': memo.content, 'wdate': memo.wdate});
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

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
                                RatingStar(),
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
                                RatingStar(),
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
                    Spacer(),
                    Container(
                      color: Color(0xff00A0C3),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              var memo = Memo(_reviewPageController.text,
                                  DateTime.now().toString());

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
                              _insertMemo(memo);
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
