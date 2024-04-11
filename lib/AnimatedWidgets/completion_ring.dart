import 'dart:math' as math;
import 'package:flutter/material.dart';

class CompletionRing extends StatefulWidget {
  final double currentPercentageValue;

  const CompletionRing({Key? key, required this.currentPercentageValue})
      : super(key: key);

  @override
  _CompletionRingState createState() => _CompletionRingState();
}

class _CompletionRingState extends State<CompletionRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _animation =
        Tween<double>(begin: 0, end: widget.currentPercentageValue).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
    initAnimation();
  }

  Future<void> initAnimation() async {
    await _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0), child: CustomPaint(
      painter: CompletionRingPainter(
        percentageValue: _animation.value,
        color: Colors.blue,
        strokeWidth: 9,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween:
              Tween<double>(begin: 0, end: widget.currentPercentageValue),
              duration: Duration(milliseconds: 800),
              builder: (context, value, child) {
                return Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${value.toInt()}%',
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Soil Humidity',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ),);
  }
}

class CompletionRingPainter extends CustomPainter {
  final double percentageValue;
  final Color color;
  final double strokeWidth;

  CompletionRingPainter({
    required this.percentageValue,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 1 - strokeWidth / 5;

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double startAngle = -math.pi / 2;
    final double sweepAngle = 2 * math.pi * (percentageValue / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CompletionRingPainter oldDelegate) {
    return oldDelegate.percentageValue != percentageValue ||
        oldDelegate.color != color;
  }
}
