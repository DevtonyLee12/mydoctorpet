import 'package:flutter/material.dart';

class BottomNaviButton extends StatelessWidget {
  BottomNaviButton({
    required this.iconType,
    required this.linkPage,
  });

  final IconData iconType;
  final dynamic linkPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 70,
        // color: Colors.red,
        child: IconButton(
          icon: Icon(
            iconType,
            size: 35,
            color: Color.fromRGBO(59, 107, 164, 1),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => linkPage),
            );
          },
        ),
      ),
    );
  }
}



// child: Icon(
//           iconType,
//           size: 40,
//           color: Color.fromRGBO(59, 107, 164, 1),
          
//         ),