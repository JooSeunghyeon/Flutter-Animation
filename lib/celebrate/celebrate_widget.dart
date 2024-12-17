import 'package:flutter/material.dart';

import 'celebrate.dart';

class CelebrateHomeWidget extends StatelessWidget {
  const CelebrateHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: CoolMode(
            particleImage: "your_image_url",
            child: SizedBox(
              width: 200,
              height: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('길게 눌러볼랫 ?!'),
              ),
            ),
          ),
        ));
  }
}
