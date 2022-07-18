import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String headTitle, text, imgUrl;
  const SplashContent({
    Key? key,
    required this.text,
    required this.imgUrl,
    required this.headTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(imgUrl),
            width: 300,
            height: 250,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10),
          Text(
            headTitle,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
