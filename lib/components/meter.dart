import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madness_meter_2/home_page.dart';
import 'package:madness_meter_2/utility.dart';

import '../provider.dart';

class MeterText extends ConsumerWidget {
  const MeterText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Align(
        alignment: Alignment.topCenter,
        child: (ref.watch(madnessMeterValue) > 0)
            ? Text('${ref.watch(madnessMeterValue).toStringAsFixed(0)} / ${ref.watch(maxMadnessValue)}',
                    style:
                        GoogleFonts.astloch(fontSize: 100, color: Colors.white))
                .animate()
                .fadeIn()
                .slideY()
            : SizedBox.shrink(),
      ),
    );
  }
}

class MadnessMeter extends ConsumerWidget {
  const MadnessMeter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.rotate(
        angle: pi,
        child: ClipPath(
          clipper: TriangleClipper(),
          child: AnimatedContainer(
            duration: 500.ms,
            width: 6.5 * ref.watch(madnessMeterValue).toDouble() * 1.2,
            height: 8 * ref.watch(madnessMeterValue).toDouble(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.01 + (0.7 * madnessAsPercent(ref)), 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      percentageToHsl(madnessAsPercent(ref), 250, 0, .35)
                          .withOpacity(.70),
                      Colors.transparent
                    ])),
          ),
        ),
      ),
    );
  }
}

class TestSlider extends ConsumerWidget {
  const TestSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 100),
        child: Slider(
          min: 0,
          max: 100,
          value: ref.watch(madnessMeterValue).toDouble(),
          onChanged: (value) {
            ref.watch(madnessMeterValue.notifier).state = value.toInt();
          },
          label: ref.watch(madnessMeterValue).toString(),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
