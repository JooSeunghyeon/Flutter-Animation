import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class HyperText extends StatefulWidget {
  const HyperText({
    super.key,
    required this.text,
    this.duration = const Duration(milliseconds: 800),
    this.style,
    this.animationTrigger = false,
    this.animateOnLoad = true,
  });

  final bool animateOnLoad;
  final bool animationTrigger;
  final Duration duration;
  final TextStyle? style;
  final String text;

  @override
  _HyperTextState createState() => _HyperTextState();
}

class _HyperTextState extends State<HyperText> {
  int animationCount = 0;
  late List<String> displayText;
  bool isFirstRender = true;
  double iterations = 0;

  final Random _random = Random();
  Timer? _timer;

  @override
  void didUpdateWidget(HyperText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animationTrigger != oldWidget.animationTrigger &&
        widget.animationTrigger) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    displayText = widget.text.split('');
    if (widget.animateOnLoad) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    iterations = 0;
    _timer?.cancel();
    animationCount++;
    final currentAnimationCount = animationCount;

    _timer = Timer.periodic(
      widget.duration ~/
          (widget.text.isNotEmpty ? widget.text.length * 10 : 10),
          (timer) {
        if (!widget.animateOnLoad && isFirstRender) {
          timer.cancel();
          isFirstRender = false;
          return;
        }
        if (iterations < widget.text.length &&
            currentAnimationCount == animationCount) {
          setState(() {
            displayText = List.generate(
              widget.text.length,
                  (i) => widget.text[i] == ' '
                  ? ' ' // 공백 유지
                  : i <= iterations
                  ? widget.text[i] // 이미 확정된 문자
                  : _generateRandomChar(widget.text[i]), // 랜덤 문자 생성
            );
          });
          iterations += 0.1;
        } else {
          timer.cancel();
          if (currentAnimationCount == animationCount) {
            setState(() {
              displayText = widget.text.split('');
            });
          }
        }
      },
    );
  }

  /// 문자 타입에 따라 영어/한글 랜덤 문자 생성
  String _generateRandomChar(String char) {
    if (_isKorean(char)) {
      return _generateRandomKoreanChar(); // 한글 랜덤 문자
    } else if (_isEnglish(char)) {
      return _generateRandomEnglishChar(); // 영어 랜덤 문자
    }
    return char; // 다른 문자는 그대로 반환
  }

  /// 랜덤 영어 문자 (A-Z)
  String _generateRandomEnglishChar() {
    return String.fromCharCode(_random.nextInt(26) + 65);
  }

  /// 랜덤 한글 문자 (가 ~ 힣)
  String _generateRandomKoreanChar() {
    final int start = 0xAC00; // '가'
    final int end = 0xD7A3; // '힣'
    return String.fromCharCode(start + _random.nextInt(end - start + 1));
  }

  /// 한글인지 확인
  bool _isKorean(String char) {
    final codeUnit = char.codeUnitAt(0);
    return codeUnit >= 0xAC00 && codeUnit <= 0xD7A3;
  }

  /// 영어인지 확인
  bool _isEnglish(String char) {
    final codeUnit = char.codeUnitAt(0);
    return (codeUnit >= 65 && codeUnit <= 90) || // 대문자
        (codeUnit >= 97 && codeUnit <= 122); // 소문자
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(displayText.length, (index) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: Text(
              displayText[index],
              key: ValueKey<String>('$animationCount-$index'),
              style: widget.style ?? Theme.of(context).textTheme.titleLarge,
            ),
          );
        }),
      ),
    );
  }
}
