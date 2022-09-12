import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../model/db_model_memo.dart';
// import 'review_page.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({Key? key, this.review}) : super(key: key);

  final Memo? review;
  // final Memo? review

  @override
  Widget build(BuildContext context) {
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 25.0,
                          initialRating: review?.ratingAverage ?? 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            CupertinoIcons.paw,
                            color: Colors.blueGrey,
                          ),
                          updateOnDrag: false,
                          ignoreGestures: true,
                          onRatingUpdate: (ratingpawone) {},
                        ),
                        Text(
                          "${review?.ratingAverage}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        "전문성",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      RatingBar.builder(
                        itemSize: 20.0,
                        initialRating: review?.ratingPawTwo ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) =>
                            Icon(CupertinoIcons.paw, color: Color(0xff00A0C3)),
                        updateOnDrag: false,
                        ignoreGestures: true,
                        onRatingUpdate: (ratingpawone) {},
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: 25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        "친절도",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      RatingBar.builder(
                        itemSize: 20.0,
                        initialRating: review?.ratingPawTwo ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) =>
                            Icon(CupertinoIcons.paw, color: Color(0xff00A0C3)),
                        updateOnDrag: false,
                        ignoreGestures: true,
                        onRatingUpdate: (ratingpawone) {},
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 255, 253, 253),
                        child: Text(
                          review?.content ?? "",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 255, 253, 253),
                        child: Text(
                          review?.createdDateString ?? "",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
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
  }
}
