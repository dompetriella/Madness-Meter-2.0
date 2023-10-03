import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/home_page.dart';
import 'package:madness_meter_2/provider.dart';
import 'package:madness_meter_2/utility.dart';

import '../models/spell.dart';

class SpellBar extends ConsumerWidget {
  const SpellBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Spell> castedSpells = ref.watch(castedSpellsListProvider);

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
          if (castedSpells.isNotEmpty)
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
          Column(
            children: [
              if (castedSpells.isNotEmpty)
                SpellButton(
                    title: castedSpells.last.spellName,
                    onPressed: () => castMadnessSpell(ref, castedSpells.last)),
              if (castedSpells.length > 1)
                SpellButton(
                    title: castedSpells[castedSpells.length - 2].spellName,
                    onPressed: () => castMadnessSpell(
                        ref, castedSpells[castedSpells.length - 2])),
              if (castedSpells.length > 2)
                SpellButton(
                    title: castedSpells[castedSpells.length - 3].spellName,
                    onPressed: () => castMadnessSpell(
                        ref, castedSpells[castedSpells.length - 3])),
            ],
          ),
        ],
      ),
    );
  }
}

class SpellButton extends ConsumerWidget {
  final bool isSpellMenu;
  final String title;
  final VoidCallback onPressed;
  const SpellButton(
      {super.key,
      required this.title,
      this.isSpellMenu = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            backgroundColor: isSpellMenu
                ? Colors.white.withOpacity(.15)
                : percentageToHsl(ref.watch(madnessMeterValue).toDouble() / 100,
                        250, 0, .35)
                    .withOpacity(.1),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
