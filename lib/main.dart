import 'package:flutter/material.dart';
import 'package:uteer/view/assets/asset_images.dart';
import 'package:uteer/view/constant/ui_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: const Offset(0, 0.1)).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: UIColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AssetImages.iconDepartment),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.blue.withOpacity(0.7),
                ),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AssetImages.iconMe),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                    position: _animation,
                    child: Image.asset(
                      AssetImages.iconUniversity,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
