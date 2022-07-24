// 리뷰
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff73E4FD),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          title: Text(
            "리뷰 작성하기",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.account_circle),
              onPressed: null,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 30,
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    "진료는 어떠셨나요?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(top: 10),

                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        // color: Colors.red,
                      ),
                      Container(
                        child: Text(
                          "전문성",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(top: 10),

                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        // color: Colors.red,
                      ),
                      Container(
                        child: Text(
                          "합리적인 가격",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                          // width: 100,
                          ),
                      Flexible(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(top: 10),

                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        // color: Colors.red,
                      ),
                      Container(
                        child: Text(
                          "친절도",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(top: 10),

                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        // color: Colors.red,
                      ),
                      Container(
                        child: Text(
                          "재방문 의사",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        iconSize: 15,
                        color: Color(0xff999999),
                      ),
                      Text(
                        "이 주치의를 단골 주치의로 등록하기",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '   장단점을 자유롭게 적어주세요',
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 80.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  // 높이 설정 가능할까봐 넣은 코드
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("작성 완료"),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
