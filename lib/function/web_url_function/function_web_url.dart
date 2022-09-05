import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebUrl {
  final Uri _url = Uri.parse("https://naver.com");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
