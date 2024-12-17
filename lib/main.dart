import 'package:flutter/material.dart';
import 'package:flutter_animation/books/books.dart';
import 'package:flutter_animation/circles_selector/circles_home_widget.dart';
import 'package:flutter_animation/folder_shape/folder_home.dart';
import 'package:flutter_animation/fx_10_hyper_text%20/hyper_text_widget.dart';
import 'package:flutter_animation/fx_7_border_beam/border_bean_widget.dart';
import 'package:flutter_animation/fx_8_meteor_border/meteors_widget.dart';
import 'package:flutter_animation/visibility/blur_fade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF1E1E1E),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        cardColor: const Color(0xFF2C2C2C),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const FolderHomeWidget(
                        curve: Curves.easeInOutBack);
                  },
                )),
                child: Text('FolderHome'),
              ),
              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BookShelfPage(title: 'Books');
                  },
                )),
                child: Text('Books'),
              ),

              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CirclesHomeWidget();
                  },
                )),
                child: Text('Circles'),
              ),

              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BlurFadeExample();
                  },
                )),
                child: Text('BlurFade'),
              ),

              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BorderBeamWidget();
                  },
                )),
                child: Text('BorderBeam'),
              ),

              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MeteorDemo();
                  },
                )),
                child: Text('Meteor'),
              ),

              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const HyperTextDemo();
                  },
                )),
                child: Text('HyperText'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
