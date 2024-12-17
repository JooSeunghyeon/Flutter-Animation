import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'hyper_text.dart';

class HyperTextDemo extends StatefulWidget {
  const HyperTextDemo({super.key});

  @override
  _HyperTextDemoState createState() => _HyperTextDemoState();
}

class _HyperTextDemoState extends State<HyperTextDemo> {
  Timer? _resetTimer;
  bool _triggerAnimation = false;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  void _handleAnimationTrigger() {
    setState(() {
      _triggerAnimation = true;
    });

    _resetTimer?.cancel();

    _resetTimer = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _triggerAnimation = false;
      });
    });
  }

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
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: HyperText(
                                text: "Hyper Text",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                                animationTrigger: _triggerAnimation,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: HyperText(
                                text: "한글은 어떻게 될까 ?",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                                animationTrigger: _triggerAnimation,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: _handleAnimationTrigger,
                            child: Text("Trigger Animation"),
                          ),
                          const SizedBox(height: 24),
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