import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.0,
              color: Color(0xff73e4fd),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          label: Text(
            "진료과목",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 10,
            color: Colors.black,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.0,
              color: Color(0xff73e4fd),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          label: Text(
            "리뷰 평점",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 10,
            color: Colors.black,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.0,
              color: Color(0xff73e4fd),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          label: Text(
            "응급 진료",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          icon:
              Icon(CupertinoIcons.chevron_down, size: 10, color: Colors.black),
        ),
      ],
    );
  }
}


//dropdownbutton
