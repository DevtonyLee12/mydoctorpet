import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 20.0,
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>
          Icon(CupertinoIcons.paw, color: Color(0xff00A0C3)),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}


// 플루터에서 rating 시스템 다운 받아야함
//https://pub.dev/packages/flutter_rating_bar/install
