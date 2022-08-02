import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 238.w,
            height: 232.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 48.h),
          Text(
            headTitle,
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 33.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
