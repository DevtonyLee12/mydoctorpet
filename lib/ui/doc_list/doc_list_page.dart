import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mypet_doctor/ui/doc_profile.dart';

import 'filter_head.dart';

class docList extends StatefulWidget {
  const docList({Key? key}) : super(key: key);

  @override
  State<docList> createState() => _docList();
}

class _docList extends State<docList> {
  final List<String> imageLIst = [
    'https://www.snuh.org/upload/med/dr/79a699d52b604c18bdd50a34f5b76251.jpg',
    'https://www.snuh.org/upload/med/dr/1026520_65318_01.jpg',
    'https://www.snuh.org/upload/med/dr/1033710_01976_01.jpg',
    'https://www.snuh.org/upload/med/dr/1034783_65621_01.jpg',
    'https://www.snuh.org/upload/med/dr/a2df63833724497ab2465fd5ac7f553c.jpg',
    'https://www.snuh.org/upload/med/dr/1014537_00787_01.jpg',
    'https://www.snuh.org/upload/med/dr/76a20bbdbd354253819859c92b7d919c.jpg',
    'https://www.snuh.org/upload/med/dr/85305dbad14f4b92a3c2df3ffe9438e2.jpg',
    'https://www.snuh.org/upload/med/dr/a963697b325e477cb1d00771442bdcd3.jpg',
    'https://www.snuh.org/upload/med/dr/b4ee6599263c4094b5e4a3f2e5a7a6b6.jpg',
  ];
  final List<String> names = [
    '홍길동',
    '김철수',
    '이영수',
    '유경회',
    '차진우',
    '황현태',
    '신지선',
    '윤희원',
    '손재민',
    '곽기섭',
  ];
  final List<String> hospitals = [
    '강동 동물병원',
    '강서 동물병원',
    '강북 동물병원',
    '동대문 동물병원',
    '송파 동물병원',
    '강동 동물병원',
    '강남 동물병원',
    '서초 동물병원',
    '동작 동물병원',
    '관악 동물병원',
  ];

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
        title: Text("주치의찾기",
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
            Expanded(
                //listview를 body 중간에 사용하기 위해서는 꼭 expanded 사용
                child: ListView.builder(
                    itemCount: imageLIst.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => DocProfile()),
                            );
                          }, //현재 리뷰 페이지로 되어 있지만, 의사 및 리뷰 페이지로 이동
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        imageLIst[index],
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
                                              names[index] + "  주치의",
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
                                              Text(hospitals[index]),
                                              SizedBox(width: 15),
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                size: 14,
                                                color: Colors.green,
                                              ),
                                              SizedBox(width: 3),
                                              Text("4.3"),
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
                                              Container(
                                                width: 90,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffff8888),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Text(
                                                  "응급진료 가능",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff3f1de),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Text("내과"),
                                                ),
                                                SizedBox(width: 15),
                                                Container(
                                                  width: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff3f1de),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Text("피부과"),
                                                ),
                                                SizedBox(width: 15),
                                                Container(
                                                  width: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff3f1de),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Text("안과"),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ])),
    );
  }
}
