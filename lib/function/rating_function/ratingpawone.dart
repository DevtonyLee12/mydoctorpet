import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPawOne extends StatefulWidget {
  const RatingPawOne({Key? key}) : super(key: key);

  @override
  State<RatingPawOne> createState() => _RatingPawOneState();
}

double _currentIndexone = 0;

@override
void initState() {
  initState();
}

class _RatingPawOneState extends State<RatingPawOne> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 20.0,
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      updateOnDrag: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>
          Icon(CupertinoIcons.paw, color: Color.fromRGBO(59, 107, 164, 1)),
      onRatingUpdate: (rating) {
        _currentIndexone = rating;
        print(rating);
      },
    );
  }
}




// 플루터에서 rating 시스템 다운 받아야함
//https://pub.dev/packages/flutter_rating_bar/install
