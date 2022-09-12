import 'package:flutter/cupertino.dart';
import 'package:mypet_doctor/ui/home/home_page.dart';
import '../../doc_list/doc_list_page.dart';
import '../widget_bottom_navigation_bar/bottom_navi_button.dart';

class BottomNavi extends StatefulWidget {
  BottomNavi({Key? key}) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNavi();
}

class _BottomNavi extends State<BottomNavi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNaviButton(
            iconType: CupertinoIcons.home,
            linkPage: homePage(),
          ),
          BottomNaviButton(
            iconType: CupertinoIcons.person_fill,
            linkPage: docList(),
          ),
          BottomNaviButton(
            iconType: CupertinoIcons.search,
            linkPage: homePage(),
          ),
        ],
      ),
    );
  }
}
