import 'package:flutter/material.dart';
import 'package:flutter_animation/particles-spark-loader%20/particles_github_spark.dart';
import 'package:flutter_animation/particles-spark-loader%20/particles_spark_loader.dart';

class ParticlesSparkLoaderDemo extends StatefulWidget {
  const ParticlesSparkLoaderDemo({Key? key}) : super(key: key);

  @override
  State<ParticlesSparkLoaderDemo> createState() => _ParticlesDemoState();
}

class _ParticlesDemoState extends State<ParticlesSparkLoaderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: StepRotatingShape(
                      size: 25,
                      rotationDuration: Duration(
                          milliseconds: 600), // Duration of each 45° rotation
                      pauseDuration: Duration(
                          milliseconds: 300), // Pause duration between rotations
                      color: Color(0xFF8157E8),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '무......한.......로......딩.......',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: RisingParticles(
                  quantity: 20,
                  maxSize: 8,
                  minSize: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}