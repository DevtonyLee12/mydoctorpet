// 로그인 (회원가입)
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          // SingleChildScrollView()를 사용하면플러터 입장에서 어디가 중앙인지 알 수 없다.
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 260,
                      child: Text(
                        "당신의 반려동물과 함께 할 특화된 전문 주치의를 찾아드려요.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "마이펫 닥터 PNG",
                        textAlign: TextAlign.start, // 왜 왼쪽으로 안 붙지?
                        style: TextStyle(
                          fontSize: 36,
                          color: Color(0xff73E4FD),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // 중간 여백
                  height: 100,
                ),
                Container(
                  width: double.infinity,
                  height: 46,
                  margin: EdgeInsets.only(top: 0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.save),
                    // Image.asset('assets/파일명.확장자),  /// 디자이너가 작업한 아이콘 적용 방법
                    label: Text(
                      "구글 계정으로 가입",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffF0696B),
                      onSurface: Colors.grey[600], // 비활성화된 버튼 색도 바꿀 수 있다.
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 46,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.save),
                    // Image.asset('assets/파일명.확장자),  /// 디자이너가 작업한 아이콘 적용 방법
                    label: Text(
                      "네이버 계정으로 가입",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1EAC43),
                      onSurface: Colors.grey[600], // 비활성화된 버튼 색도 바꿀 수 있다.
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 46,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.save),
                    // Image.asset('assets/파일명.확장자),  /// 디자이너가 작업한 아이콘 적용 방법
                    label: Text(
                      "카카오 계정으로 가입",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFFE429),
                      onSurface: Colors.grey[600], // 비활성화된 버튼 색도 바꿀 수 있다.
                    ),
                  ),
                ),
                Container(
                  // 하단 여백
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
