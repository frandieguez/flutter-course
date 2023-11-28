import 'package:flutter/material.dart';
import 'package:harrypotter/screens/adaptive_page.dart';
import 'package:harrypotter/styles/app_styles.dart';

import '../gen/assets.gen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String status = "Loading...";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: AppStyles.saffron,
          child: Assets.images.hpBackground.image(fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(flex: 1, child: Text(status)),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      status = "Connecting to backend...";
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      status = "Loading resources...";
    });
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AdaptivePage()));
    }
  }
}
