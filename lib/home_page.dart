import 'dart:async';

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
    final initFunction = useCallback((_) async {
      final stream = supabase
          .from('player_session')
          .stream(primaryKey: ["id"]).eq('id', ref.read(sessionIdProvider));
      stream.listen((data) {
        PlayerSession session = PlayerSession.fromJson(data.first);
        ref.read(madnessMeterValue.notifier).state = session.madnessValue;
      });
    }, []);

    useEffect(() {
      initFunction(null);
    }, []);

    return Scaffold(
        drawer: const SpellsDrawer(),
        body: SafeArea(
            child: Stack(
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
          ],
        )));
  }
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

    return Center(
        child: Stack(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Positioned(
            //   left: 0,
            //   child: Container(
            //     height: loginHeight,
            //     width: loginWidth,
            //     color: Colors.white,
            //   ),
            // )
          ],
        ),
        Center(
          child: !isHeld.value
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      fixedSize: Size(loginWidth, loginHeight),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.transparent),
                  onPressed: () {},
                  onLongPress: () {
                    Timer(Duration(milliseconds: (2000 > 500) ? 2000 - 500 : 0),
                        () {
                      isHeld.value = !isHeld.value;
                    });
                  },
                  child: Text('Hold',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.astloch(
                          fontSize: 90, color: Colors.white)),
                )
              : Center(
                  child: Container(
                      height: loginHeight,
                      width: loginWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: TextField(
                        inputFormatters: [UpperCaseTextFormatter()],
                        autofocus: true,
                        cursorColor: Colors.red.shade900.withOpacity(.50),
                        style: TextStyle(
                            fontSize: 150,
                            color: Colors.red.shade900.withOpacity(.50),
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
      ],
    ));
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
