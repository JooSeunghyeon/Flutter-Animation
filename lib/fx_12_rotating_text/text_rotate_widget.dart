import 'package:flutter/material.dart';
import 'package:flutter_animation/fx_12_rotating_text/text_rotate.dart';

class TextRotateDemo extends StatefulWidget {
  const TextRotateDemo({super.key});

  @override
  _TextRotateDemoState createState() => _TextRotateDemoState();
}

class _TextRotateDemoState extends State<TextRotateDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: const IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: RotatingTextWidget(
                                text: '돌고 돌아가는 텍스트',
                                radius: 100.0,
                                textStyle:
                                TextStyle(fontSize: 18, color: Colors.blue),
                                rotationDuration: Duration(seconds: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}