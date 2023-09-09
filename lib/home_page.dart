import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/main.dart';
import 'package:madness_meter_2/provider.dart';

double sideBarSize = 300;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: const SpellsDrawer(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Flexible(
                child: Container(color: Colors.black87),
              ),
              Container(
                width: sideBarSize,
                color: Colors.black,
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20, right: 64),
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
                    SpellButton(
                        title: 'Trade Sanity', onPressed: () => print('hello')),
                    SpellButton(
                        title: 'Trade Sanity', onPressed: () => print('hello')),
                    SpellButton(
                        title: 'Trade Sanity', onPressed: () => print('hello')),
                  ],
                ),
              ),
            ],
          ),
        )));
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
              child: ListView(
                children: [SpellDescription(), SpellDescription()],
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
