import 'package:flutter/material.dart';
import 'blur_fade_widget.dart';


class BlurFadeExample extends StatefulWidget {
  const BlurFadeExample({super.key});

  @override
  State<BlurFadeExample> createState() => _BlurFadeExampleState();
}

class _BlurFadeExampleState extends State<BlurFadeExample> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlurFade(
              isVisible: _isVisible,
              child: titleText('Hello, World! 👋'),
            ),
            padding(),
            BlurFade(
              delay: const Duration(milliseconds: 100),
              isVisible: _isVisible,
              child: normalText('안농 ~!~!~!'),
            ),
            padding(),
            BlurFade(
              delay: const Duration(milliseconds: 200),
              isVisible: _isVisible,
              child: normalText('to...........'),
            ),
            padding(),
            BlurFade(
              delay: const Duration(milliseconds: 300),
              isVisible: _isVisible,
              child: normalText('meet...........'),
            ),
            padding(),
            BlurFade(
              delay: const Duration(milliseconds: 400),
              isVisible: _isVisible,
              child: normalText('you...........'),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () => setState(() => _isVisible = !_isVisible),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 50),
              ),
              child: Text(_isVisible ? '꼭꼭 숨어라~!' : '나와랏~!'),
            ),
          ],
        ),
      ),
    );
  }

  Padding padding() => const Padding(padding: EdgeInsets.all(5));

  Text normalText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Text titleText(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}