// 홈
import 'package:flutter/material.dart';
import 'package:mypet_doctor/ui/doc_list/doc_list_page.dart';
import 'package:mypet_doctor/ui/doc_profile.dart';
import 'package:mypet_doctor/ui/review_page.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff73E4FD),
          centerTitle: true,
          title: Text(
            "서울시 송파구 잠실동",
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '반려동물과 함께 할\n특화된 전문 주치의 찾기',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Align(
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
                      ],
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'to be continued..',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Align(
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
                              '진료 내역',
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
                      ],
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
        // bottomNavigationBar: Container(백단 추후 구현),
      ),
    );
  }
}


// 실패!
// class homePage extends StatefulWidget {
//   const homePage({Key? key}) : super(key: key);

//   @override
//   State<homePage> createState() => _homePageState();
// }

// class _homePageState extends State<homePage> {
//   // 클래스 내 함수 및 변수 선언

//   int _selectedIndex = 0; // 변수 초기화 : 선택된 페이지의 인덱스 넘버 초기화

//   static const TextStyle optionStyle = TextStyle(
//     // 변수에 텍스트 스타일 지정해서 저장.
//     fontSize: 30,
//     fontWeight: FontWeight.w400,
//   );

//   final List<Widget> _widgetOptions = <Widget>[
//     // 변수에 리스트를 담았다 = 연결할 페이지의 클래스들을 담은 위젯.
//     DocProfile(),
//     homePage(),
//     ReviewPage(),
//   ];

//   void _onItemTapped(int index) {
//     // 탭을 클릭할 경우 지정 페이지로 이동하는 함수.
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // 메인 위젯
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xff73E4FD),
//           centerTitle: true,
//           title: Text(
//             "서울시 송파구 잠실동",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           actions: [
//             IconButton(
//               iconSize: 35,
//               icon: Icon(Icons.account_circle),
//               onPressed: null,
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey,
//                   ),
//                   width: double.infinity,
//                   height: 300,
//                   margin: EdgeInsets.only(top: 16),
//                   // 배경에 이미지 삽입 하는 기능 미리 구현
//                   // decoration: BoxDecoration(
//                   //   image: DecorationImage(
//                   //     fit: BoxFit.cover,
//                   //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
//                   //   ),
//                   // ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             '반려동물과 함께 할\n특화된 전문 주치의 찾기',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => docList()),
//                               );
//                             },
//                             child: Text(
//                               '주치의 찾기',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               primary: Color(0xff344047),
//                               minimumSize: Size(109, 32),
//                               shape: RoundedRectangleBorder(
//                                   // shape : 버튼의 모양을 디자인 하는 기능
//                                   borderRadius: BorderRadius.circular(25.0)),
//                               // maximumSize: Size(100, 50),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey,
//                   ),
//                   width: double.infinity,
//                   height: 300,
//                   margin: EdgeInsets.only(top: 16),
//                   // 배경에 이미지 삽입 하는 기능 미리 구현
//                   // decoration: BoxDecoration(
//                   //   image: DecorationImage(
//                   //     fit: BoxFit.cover,
//                   //     image: AssetImage('assets/background.jpeg'), // 배경 이미지
//                   //   ),
//                   // ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'to be continued..',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => docList()),
//                               );
//                             },
//                             child: Text(
//                               '진료 내역',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               primary: Color(0xff344047),
//                               minimumSize: Size(109, 32),
//                               shape: RoundedRectangleBorder(
//                                   // shape : 버튼의 모양을 디자인 하는 기능
//                                   borderRadius: BorderRadius.circular(25.0)),
//                               // maximumSize: Size(100, 50),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 16,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.text_snippet),
//               label: '1번 버튼 테스트',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.text_snippet),
//               label: '2번 버튼 테스트',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.text_snippet),
//               label: '3번 버튼 테스트',
//             ),
//           ],
//           currentIndex: _selectedIndex, // 지정 인덱스로 이동
//           selectedItemColor: Colors.lightBlue,
//           onTap: _onItemTapped, //선언했던 onItemTapped
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     //해당 클래스가 호출되었을떄
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
