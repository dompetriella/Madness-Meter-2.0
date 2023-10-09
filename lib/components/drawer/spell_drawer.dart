import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/db_functions.dart';
import 'package:madness_meter_2/provider.dart';
import '../../home_page.dart';
import '../../models/spell.dart';
import 'spell_description.dart';

late Future<List<Spell>> dbSpells;

class SpellsDrawer extends HookConsumerWidget {
  const SpellsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      try {
        getAvailableSpellsInState(ref);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ' + e.toString())));
      }
      return null;
    }, const []);
    return Drawer(
      width: MediaQuery.of(context).size.width - sideBarSize - 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.white.withOpacity(.05),
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
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Madness Spell List',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              letterSpacing: 3),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView(children: [
                      for (var i = 0;
                          i < ref.watch(availableSpellsProvider).length;
                          i++)
                        SpellDescription(
                            spell: ref.watch(availableSpellsProvider)[i])
                    ]),
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
