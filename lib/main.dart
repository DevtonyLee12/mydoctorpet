import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'filter_head.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          backgroundColor: Colors.blueAccent[100],
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.paw, //발자국 수정
              color: Colors.black,
            ),
            onPressed: () {},
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
              SizedBox(height: 8),
              Expanded(
                  //listview를 body 중간에 사용하기 위해서는 꼭 expanded 사용
                  child: ListView.builder(
                      itemCount: imageLIst.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 0,
                            color: Colors.white10,
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(imageLIst[index]),
                                  radius: 30.0),
                              title: Text(
                                names[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(hospitals[index]),
                              isThreeLine: true,
                              dense: false,
                              onTap: () {},
                            ));
                      }))
            ])));
  }
}





// class를 다시 만들어서 헤더 타이틀 만들기


//19,14,14

// leading: Image.network(
//    'https://cdn.imweb.me/thumbnail/20190820/c688b7d71214a.jpg',
//  height: double.infinity,
// width: 30,
//),

//paw — Cupertino icon for an outlined paw. [...]
