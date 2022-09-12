// 홈
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mypet_doctor/function/web_url_function/function_web_url.dart';
import 'package:mypet_doctor/ui/doc_list/doc_list_page.dart';
import 'widget_bottom_navigation_bar/bottom_navi.dart';
import 'package:mypet_doctor/function/web_url_function/function_web_url.dart';
import 'package:url_launcher/url_launcher.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(130, 187, 255, 1),
          centerTitle: true,
          title: Text(
            "서울시 송파구 잠실동",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          // actions: [
          //   IconButton(
          //     iconSize: 35,
          //     icon: Icon(Icons.account_circle),
          //     onPressed: null,
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(238, 246, 255, 1),
                        ),
                        height: 224,
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          '반려동물의 멋진 수의사!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        // width: double.infinity,
                        height: 224,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/home_dog_1.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => docList()),
                              );
                            },
                            child: Text(
                              '수의사 찾기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(59, 107, 164, 1),
                              minimumSize: Size(109, 32),
                              shape: RoundedRectangleBorder(
                                  // shape : 버튼의 모양을 디자인 하는 기능
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(238, 246, 255, 1),
                        ),
                        height: 224,
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          '우리동네 수의사를 소개합니다.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      // Positioned(

                      //   child: Container(
                      //     // width: double.infinity,
                      //     height: 224,
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         image: AssetImage("assets/images/home_dog_2.png"),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              launch('https://forms.gle/FoAHxQ8HSy6cVMn46');
                              // launchUrl('https://naver.com');
                            },
                            child: Text(
                              '추천하기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(59, 107, 164, 1),
                              minimumSize: Size(109, 32),
                              shape: RoundedRectangleBorder(
                                  // shape : 버튼의 모양을 디자인 하는 기능
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavi(),
      ),
    );
  }
}
