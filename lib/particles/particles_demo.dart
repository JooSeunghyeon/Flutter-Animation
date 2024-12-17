import 'package:flutter/material.dart';
import 'package:flutter_animation/particles/particles_widget.dart';

class ParticlesDemo extends StatefulWidget {
  const ParticlesDemo({super.key});

  @override
  State<ParticlesDemo> createState() => _ParticlesDemoState();
}

class _ParticlesDemoState extends State<ParticlesDemo> {
  Color particleColor = Colors.white;
  bool isDarkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateThemeColor();
  }

  void _updateThemeColor() {
    final brightness = Theme.of(context).brightness;
    setState(() {
      isDarkMode = brightness == Brightness.dark;
      particleColor = isDarkMode ? Colors.white : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Positioned.fill(
                child: Particles(
                  quantity: 100,
                  ease: 80,
                  color: particleColor,
                  key: ValueKey(particleColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}