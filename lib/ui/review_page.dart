// 리뷰
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mypet_doctor/function/rating_function/ratingStar.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

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
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '  소중한 리뷰를 남겨주세요~!'),
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
                            Navigator.pop(
                                context); //실제로는 작성 완료 시 해당의사 평점이 업데이트 되야함, 수정 필요
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
