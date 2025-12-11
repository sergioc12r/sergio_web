import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sergio_web/common/icons/cu_icons.dart';

class CULoading extends StatefulWidget {
  const CULoading({super.key});

  @override
  State<CULoading> createState() => _CULoadingState();
}

class _CULoadingState extends State<CULoading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              CUIcons.loadingJson,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
