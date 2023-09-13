import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/main.dart';
import 'package:madness_meter_2/provider.dart';

double sideBarSize = 300;
double topPadding = 16;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            TestSlider()
          ],
        )));
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
            opacity: .99 * (1 + ref.watch(madnessMeterValue)) / (100),
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
        color: percentageToHsl(
                ref.watch(madnessMeterValue).toDouble() / 100, 250, 0, .35)
            .withOpacity(.20 * (ref.watch(madnessMeterValue) / 100)));
  }
}

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
        child: Text('${ref.watch(madnessMeterValue).toStringAsFixed(0)} / 100',
            style: GoogleFonts.astloch(fontSize: 100, color: Colors.white)),
      ),
    );
  }
}

class SpellBar extends StatelessWidget {
  const SpellBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sideBarSize,
      child: Column(
        children: [
          Builder(builder: (context) {
            return SpellButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              title: 'Spells List',
              isSpellMenu: true,
            );
          }),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20, right: 64),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Cast Recent',
                style: TextStyle(
                    fontSize: 22,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
          SpellButton(title: 'Trade Sanity', onPressed: () => print('hello')),
          SpellButton(title: 'Trade Sanity', onPressed: () => print('hello')),
          SpellButton(title: 'Trade Sanity', onPressed: () => print('hello')),
        ],
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
            duration: 50.ms,
            width: 5 * ref.watch(madnessMeterValue).toDouble() * 1.2,
            height: 8 * ref.watch(madnessMeterValue).toDouble(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [
                      0.01 + (0.7 * (ref.watch(madnessMeterValue) / 100)),
                      1
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      percentageToHsl(
                              ref.watch(madnessMeterValue).toDouble() / 100,
                              250,
                              0,
                              .35)
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

class MadSkullWidget extends StatelessWidget {
  const MadSkullWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.asset('assets/mad_skull.png'),
          ),
        ),
      ),
    );
  }
}

class SpellsDrawer extends StatelessWidget {
  const SpellsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - sideBarSize - 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.white.withOpacity(.15),
      child: Row(
        children: [
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 180,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Madness Spell List',
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView(
                      children: [
                        SpellDescription(),
                        SpellDescription(),
                        SpellDescription(),
                        SpellDescription(),
                        SpellDescription(),
                        SpellDescription(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Container(
            width: 3,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class SpellDescription extends StatelessWidget {
  const SpellDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 1.5),
            gradient: LinearGradient(
                colors: [Color.fromRGBO(40, 40, 40, 1), Colors.transparent])),
      ),
    );
  }
}

class SpellButton extends StatelessWidget {
  final bool isSpellMenu;
  final String title;
  final VoidCallback onPressed;
  const SpellButton(
      {super.key,
      required this.title,
      this.isSpellMenu = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSpellMenu ? 16.0 : 8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                letterSpacing: 3,
                fontSize: isSpellMenu ? 32 : 18,
                color: Colors.white,
                fontWeight: FontWeight.w200),
          ),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: isSpellMenu ? Size(200, 90) : Size(200, 75),
            backgroundColor: Colors.white.withOpacity(.15),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Convert the new input text to uppercase
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

Future<int> retrieveSessionIdByName(String campaignName) async {
  final List<dynamic> sessionId = await supabase
      .from('player_session')
      .select('id')
      .eq('campaign_name', campaignName.toLowerCase());
  return sessionId.first['id'];
}

setCurrentSessionId(int id, WidgetRef ref) {
  ref.watch(sessionIdProvider.notifier).state = id;
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

Color percentageToHsl(double percent, int hue0, int hue1, double lightness) {
  var percentFilled = percent;
  if (percent >= 1) {
    percentFilled = 1;
  }
  double returnHue = ((percentFilled * (hue1 - hue0)) + hue0);
  return HSLColor.fromAHSL(1, returnHue, 1, lightness).toColor();
}
