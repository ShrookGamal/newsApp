import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, RoutesManager.home));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(
              AssetsManager.scaffoldBg,
              height: double.infinity,
              width: double.infinity,
            )),
        Image.asset(
          AssetsManager.splashLogo,
          width: 199.w,
          height: 208.h,
        ),
      ],
    );
  }
}
