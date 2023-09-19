import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/utility.dart';

class MadSkullWidget extends ConsumerWidget {
  const MadSkullWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = 150;
    double width = 150;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Center(
          child: Stack(
            children: [
              SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    EyeGlow(
                      height: height,
                      width: width,
                      left: 0,
                      right: width * .35,
                    ),
                    EyeGlow(
                      height: height,
                      width: width,
                      left: width * .35,
                      right: 0,
                    ),
                    Center(child: Image.asset('assets/mad_skull.png')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EyeGlow extends HookConsumerWidget {
  final double height;
  final double width;
  final double right;
  final double left;
  const EyeGlow(
      {super.key,
      required this.height,
      required this.width,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color color =
        percentageToHsl(madnessAsPercent(ref), 250, 0, .35).withOpacity(.70);

    return Positioned(
      bottom: 48,
      left: left,
      right: right,
      child: Opacity(
          opacity: madnessAsPercent(ref),
          child: AnimatedContainer(
              duration: 400.ms,
              decoration: BoxDecoration(
                  color: color,
                  boxShadow: [
                    BoxShadow(color: color, spreadRadius: 3, blurRadius: 3)
                  ],
                  shape: BoxShape.circle),
              height: height * .12 * madnessAsPercent(ref),
              width: width * .12 * madnessAsPercent(ref))),
    );
  }
}
