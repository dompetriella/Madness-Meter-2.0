import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/utility.dart';

import '../../models/Spell.dart';
import '../../models/madness_type.dart';

class SpellDescription extends StatelessWidget {
  final Spell spell;
  const SpellDescription({super.key, required this.spell});

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 24, 10),
                            child: Text(
                              '${spell.spellName} - ${MadnessType.values[spell.spellType].name} (d${MadnessType.values[spell.spellType].rollValue})',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 3),
                            ),
                          ),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              spell.description,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14,
                                  letterSpacing: 2),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: CastButton(spell: spell))
            ],
          ),
        ),
      ),
    );
  }
}

class CastButton extends ConsumerWidget {
  final Spell spell;
  const CastButton({super.key, required this.spell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => castMadnessSpell(ref, spell),
      child: Center(
        child: Text(
          'Cast Spell',
          style: TextStyle(
              letterSpacing: 3,
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w200),
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(180, 90),
          backgroundColor: Color.fromRGBO(40, 40, 40, .7),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 6,
              ),
              borderRadius: BorderRadius.circular(20))),
    );
  }
}
