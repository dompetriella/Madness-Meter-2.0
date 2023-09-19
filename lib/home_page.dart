import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/components/drawer/spell_drawer.dart';
import 'package:madness_meter_2/components/meter.dart';
import 'package:madness_meter_2/components/skull.dart';
import 'package:madness_meter_2/components/spell_bar.dart';
import 'package:madness_meter_2/db_functions.dart';
import 'package:madness_meter_2/provider.dart';

import 'utility.dart';

double sideBarSize = 300;
double topPadding = 16;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionIdProvider) > 0
        ? Scaffold(
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
                TestSlider()
              ],
            )))
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

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(800, 300),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white.withOpacity(.25)),
      onPressed: () => print('hello'),
      child: Text('Hold',
          textAlign: TextAlign.center,
          style: GoogleFonts.astloch(fontSize: 90, color: Colors.white)),
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

class CampaignLookup extends HookConsumerWidget {
  const CampaignLookup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sessionEntry = useState('');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 200,
            height: 50,
            color: Colors.blue.shade800,
            child: TextField(
              onChanged: (value) {
                sessionEntry.value = value;
              },
              inputFormatters: [UpperCaseTextFormatter()],
              style: TextStyle(fontSize: 32),
              decoration: InputDecoration(),
              textAlign: TextAlign.center,
            )),
        ElevatedButton(
            onPressed: () async {
              setCurrentSessionId(
                  await retrieveSessionIdByName(sessionEntry.value), ref);
            },
            child: Text('Press'))
      ],
    );
  }
}
