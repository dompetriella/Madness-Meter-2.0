import 'package:flutter/material.dart';
import 'package:madness_meter_2/content/spells.dart';

import '../../home_page.dart';
import 'spell_description.dart';

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
                    child: ListView(
                      children: [
                        for (var i = 0; i < fakeSpellsList.length; i++)
                          SpellDescription(spell: fakeSpellsList[i])
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
