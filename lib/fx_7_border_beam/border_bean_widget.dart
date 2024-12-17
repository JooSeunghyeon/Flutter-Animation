import 'package:flutter/material.dart';

import 'border_beam.dart';

class BorderBeamWidget extends StatelessWidget {
  const BorderBeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Center(
        child: BorderBeam(
          duration: 7,
          colorFrom: Colors.blue,
          colorTo: Colors.purple,
          staticBorderColor:
          const Color.fromARGB(255, 39, 39, 42), //rgb(39 39 42)
          borderRadius: BorderRadius.circular(20),
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 200,
            height: 200,
            child: const Center(
              child: Text('Border Beam',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}