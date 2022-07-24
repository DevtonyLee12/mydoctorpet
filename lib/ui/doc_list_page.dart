import 'package:flutter/material.dart';
import 'package:mypet_doctor/ui/doc_profile.dart';

class docList extends StatelessWidget {
  const docList({Key? key}) : super(key: key);

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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "docList",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.only(top: 16),
                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocProfile()),
                          );
                        },
                        child: Text(
                          '주치의 찾기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff344047),
                          minimumSize: Size(109, 32),
                          shape: RoundedRectangleBorder(
                              // shape : 버튼의 모양을 디자인 하는 기능
                              borderRadius: BorderRadius.circular(25.0)),
                          // maximumSize: Size(100, 50),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.only(top: 16),
                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Align(
                    child: Text(
                      "과잉진료 사례 신고해주세요!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.only(top: 16),
                  // 배경에 이미지 삽입 하는 기능 미리 구현
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
                  //   ),
                  // ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          '진료내역',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff344047),
                          minimumSize: Size(109, 32),
                          shape: RoundedRectangleBorder(
                              // shape : 버튼의 모양을 디자인 하는 기능
                              borderRadius: BorderRadius.circular(25.0)),
                          // maximumSize: Size(100, 50),
                        ),
                      ),
                    ),
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
