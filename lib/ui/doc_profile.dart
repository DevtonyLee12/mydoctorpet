import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypet_doctor/ui/review_page.dart';

class DocProfile extends StatefulWidget {
  const DocProfile({Key? key}) : super(key: key);

  @override
  State<DocProfile> createState() => _DocProfile();
}

class _DocProfile extends State<DocProfile> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  List<dynamic> reviewList = []; // 리뷰 작성 page에서 리뷰를 받아서 list에 보관

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,
              color: Color.fromARGB(2552, 115, 210, 243)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "어디어디 동물병원",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Color.fromARGB(255, 115, 210, 243),
      ),
      body: ListView(
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 이미지
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://image.shutterstock.com/image-photo/female-veterinarian-examining-cute-mini-260nw-1257887227.jpg",
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
                      style:
                          TextStyle(color: Color.fromARGB(255, 131, 174, 210)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(
            "김아무개 주치의",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),

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
                        "어디어디 동물병원",
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 239, 247),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "4.6",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.paw,
                                size: 25,
                                color: Colors.blueGrey,
                              ),
                              Icon(
                                CupertinoIcons.paw,
                                size: 25,
                                color: Colors.blueGrey,
                              ),
                              Icon(
                                CupertinoIcons.paw,
                                size: 25,
                                color: Colors.blueGrey,
                              ),
                              Icon(
                                CupertinoIcons.paw,
                                size: 25,
                                color: Colors.blueGrey,
                              ),
                              Icon(
                                CupertinoIcons.paw,
                                size: 25,
                                color: Colors.blueGrey,
                              ),
                              Text(
                                " (34)",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
            ),
          ),

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
          Container(
            height: 500,
            child: TabBarView(
              controller: tabController,
              children: [
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
                                      color:
                                          Color.fromARGB(255, 252, 249, 210)),
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
                                          "10:00 ~ 17:00",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        "(점심시간 13:00 ~ 14:00)",
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
                                      color:
                                          Color.fromARGB(255, 252, 249, 210)),
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
                                          "10:00 ~ 13:00",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        "(점심시간 없음)",
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
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 30,
                          color: Color.fromARGB(255, 249, 247, 247),
                          child: Text(
                            "지도",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 300,
                          color: Color.fromARGB(255, 248, 238, 238),
                          child: Text(
                            "지도",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
                reviewList.isEmpty // reviewList가 비어있으면,
                    ? Container(
                        alignment: Alignment(0.0, -0.7),
                        decoration: BoxDecoration(),
                        height: 1,
                        width: double.infinity,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "첫 리뷰를 남겨주세요",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(CupertinoIcons.paw)
                            ]))
                    : Expanded(
                        //reviewList가 있으면
                        child: ListView.builder(
                          itemCount: reviewList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 25,
                                        child: Row(
                                          children: [
                                            Image.network(
                                              "https://image.shutterstock.com/image-photo/female-veterinarian-examining-cute-mini-260nw-1257887227.jpg",
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.fill,
                                            ),
                                            Text(
                                              "박리뷰어",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.paw,
                                                  size: 25,
                                                  color: Colors.blueGrey,
                                                ),
                                                Icon(
                                                  CupertinoIcons.paw,
                                                  size: 25,
                                                  color: Colors.blueGrey,
                                                ),
                                                Icon(
                                                  CupertinoIcons.paw,
                                                  size: 25,
                                                  color: Colors.blueGrey,
                                                ),
                                                Icon(
                                                  CupertinoIcons.paw,
                                                  size: 25,
                                                  color: Colors.blueGrey,
                                                ),
                                                Icon(
                                                  CupertinoIcons.paw,
                                                  size: 25,
                                                  color: Colors.blueGrey,
                                                ),
                                                Text(
                                                  " 5.0",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(top: 30),
                                        height: 25,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Row(
                                            children: [
                                              Text(
                                                "전문성",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(top: 10),
                                        height: 25,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Row(
                                            children: [
                                              Text(
                                                "친절도",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.paw,
                                                    size: 25,
                                                    color: Colors.blueGrey,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(top: 20),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                color: Color.fromARGB(
                                                    255, 255, 253, 253),
                                                child: Text(
                                                  reviewList[index],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 3),
            child: ElevatedButton(
              onPressed: () async {
                String? job = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReviewPage()),
                );
                if (job != null) {
                  setState(() {
                    reviewList.add(job);
                  });
                }
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
          // 설명
        ],
        // ),
      ),
    );
  }
}
