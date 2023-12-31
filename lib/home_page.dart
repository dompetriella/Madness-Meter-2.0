import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/components/drawer/spell_drawer.dart';
import 'package:madness_meter_2/components/meter.dart';
import 'package:madness_meter_2/components/skull.dart';
import 'package:madness_meter_2/components/spell_bar.dart';
import 'package:madness_meter_2/db_functions.dart';
import 'package:madness_meter_2/provider.dart';

import 'main.dart';
import 'models/player_session.dart';
import 'utility.dart';

double sideBarSize = 300;
double topPadding = 16;

AnimationController? changedNumberAnimation;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionIdProvider) > 0
        ? MadnessPage()
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.01, 0.2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.purple.shade900, Colors.black])),
                ),
                Login(),
              ],
            ),
          );
  }
}

class MadnessPage extends HookConsumerWidget {
  const MadnessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AnimationController changedValueAnimationController =
        useAnimationController(duration: 1500.ms);

    final initFunction = useCallback((_) async {
      final stream = supabase
          .from('player_session')
          .stream(primaryKey: ["id"]).eq('id', ref.read(sessionIdProvider));
      stream.listen((data) {
        PlayerSession session = PlayerSession.fromJson(data.first);
        int previousValue = ref.read(madnessMeterValue);
        ref.read(madnessMeterValue.notifier).state = session.madnessValue;
        int change = session.madnessValue - previousValue;
        ref.read(changedMadnessMeterValue.notifier).state = change;
        if (change > 0) {
          changedValueAnimationController.forward().then((value) =>
              changedValueAnimationController.animateBack(0.0,
                  duration: 1500.ms));
          int dieRoll = Random().nextInt(4) + 1;
          ref.read(madnessCondition.notifier).state =
              giveMadnessStatus(dieRoll);
        }
      });
    }, []);

    useEffect(() {
      initFunction(null);
    }, []);

    var currentMeter = ref.watch(madnessMeterValue);
    var maxMeter = ref.watch(maxMadnessValue);

    return Scaffold(
        drawer: const SpellsDrawer(),
        body: Stack(
          children: [
            Background(),
            ImageBackground(),
            BackgroundTint(),
            Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SpellBar(),
                ],
              ),
            ),
            MeterText(),
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: MadnessMeter(),
            ),
            MadSkullWidget(),
            Center(
                child: currentMeter <= maxMeter
                    ? ChangedMadnessValueText(
                        changedValueAnimation: changedValueAnimationController,
                      )
                    : AnimatedBuilder(
                        animation: changedValueAnimationController,
                        builder: (context, child) {
                          return Text(ref.watch(madnessCondition),
                              style: TextStyle(
                                  fontSize: 80,
                                  color: Colors.white.withOpacity(
                                      changedValueAnimationController.value),
                                  fontWeight: FontWeight.w600));
                        })),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Last Roll: ${currentMeter <= maxMeter ? ref.watch(changedMadnessMeterValue) : ref.watch(madnessCondition)}',
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ],
        ));
  }
}

class ChangedMadnessValueText extends HookConsumerWidget {
  final AnimationController changedValueAnimation;
  const ChangedMadnessValueText(
      {super.key, required this.changedValueAnimation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: ref.watch(changedMadnessMeterValue) > 0
            ? AnimatedBuilder(
                animation: changedValueAnimation,
                builder: (context, child) {
                  return Text(ref.watch(changedMadnessMeterValue).toString(),
                      style: GoogleFonts.astloch(
                          fontSize: 140,
                          color: Colors.white
                              .withOpacity(changedValueAnimation.value),
                          fontWeight: FontWeight.w600));
                })
            : SizedBox.shrink());
  }
}

List<CongregateContainer> createCongregates(
    AnimationController animationController) {
  Random random = Random();
  List<CongregateContainer> congregates = [];
  int numberOfCongregates = 5 + random.nextInt(20 - 5);
  for (var i = 0; i < numberOfCongregates; i++) {
    double offsetX = -1000 + random.nextInt(2001).toDouble();
    double offsetY = -1000 + random.nextInt(2001).toDouble();
    double startingHeight = 50 + random.nextInt(251).toDouble();
    double startingWidth = 50 + random.nextInt(751).toDouble();
    congregates.add(CongregateContainer(
        offsetX: offsetX,
        offsetY: offsetY,
        startingWidth: startingWidth,
        startingHeight: startingHeight,
        animationController: animationController));
  }
  return congregates;
}

double loginWidth = 800;
double loginHeight = 300;

class Login extends HookConsumerWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isHeld = useState(false);
    ValueNotifier<bool> isHeldLongEnough = useState(false);
    var animationController =
        useAnimationController(duration: 2000.ms, reverseDuration: 500.ms);
    Random random = Random();

    final animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOutExpo);

    Timer? timer;

    void startTimer() {
      timer = Timer(Duration(seconds: 2), () {
        if (isHeld.value) {
          isHeldLongEnough.value = true;
        }
      });
    }

    void cancelTimer() {
      if (timer != null && timer!.isActive) {
        timer!.cancel();
      }
    }

    return Center(
        child: Stack(
      children: [
        AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Stack(
                  clipBehavior: Clip.none,
                  children: createCongregates(animationController));
            }),
        Center(
          child: !isHeldLongEnough.value
              ? GestureDetector(
                  onPanDown: (details) async {
                    isHeld.value = true;
                    startTimer();
                    animationController.forward();
                  },
                  onTapUp: (details) {
                    isHeld.value = false;
                    cancelTimer();
                    animationController.reverse();
                  },
                  child: Container(
                    height: loginHeight,
                    width: loginWidth,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey.shade200, width: 7)),
                    child: Center(
                      child: Text('Hold',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.astloch(
                              fontSize: 90, color: Colors.white)),
                    ),
                  ),
                )
              : Center(
                  child: Container(
                      height: loginHeight,
                      width: loginWidth,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.white
                                .withOpacity(animationController.value),
                            spreadRadius: 50,
                            blurRadius: 50)
                      ], borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: TextField(
                        inputFormatters: [UpperCaseTextFormatter()],
                        autofocus: true,
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontSize: 150,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 30),
                        decoration: InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.center,
                        onChanged: (value) async {
                          if (value.toLowerCase() == 'vessel') {
                            Future.delayed(500.ms).then((future) async {
                              PlayerSession session =
                                  await getSessionIdByName(value.toLowerCase());
                              ref.read(sessionIdProvider.notifier).state =
                                  session.id;
                            });
                          }
                        },
                      ))),
                ),
        ),
        if (isHeldLongEnough.value)
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'YOUR',
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'FATE?',
                  style: TextStyle(color: Colors.red, fontSize: 60),
                ),
              ].animate(interval: 800.ms).fadeIn().slideY(),
            ),
          )
      ],
    ));
  }
}

class CongregateContainer extends StatelessWidget {
  final AnimationController animationController;
  final double offsetX;
  final double offsetY;
  final double startingWidth;
  final double startingHeight;
  const CongregateContainer({
    super.key,
    required this.offsetX,
    required this.offsetY,
    required this.startingWidth,
    required this.startingHeight,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(offsetX - (offsetX * animationController.value),
          offsetY - (offsetY * animationController.value)),
      child: Center(
        child: Container(
          height: startingHeight +
              ((loginHeight - startingHeight) * animationController.value),
          width: startingWidth +
              ((loginWidth - startingWidth) * animationController.value),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20 * animationController.value),
              color: Colors.white.withOpacity(animationController.value / 5)),
        ),
      ),
    );
  }
}

class ImageBackground extends ConsumerWidget {
  const ImageBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Opacity(
            opacity: .99 * madnessAsPercent(ref),
            child: Image.asset('assets/starry_bg.png')),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class BackgroundTint extends ConsumerWidget {
  const BackgroundTint({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: percentageToHsl(madnessAsPercent(ref), 250, 0, .35)
            .withOpacity(.20 * (ref.watch(madnessMeterValue) / 100)));
  }
}
