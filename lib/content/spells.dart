import '../models/spell.dart';

List<Spell> fakeSpellsList = [
  const Spell(
      spellName: 'Trade Sanity',
      description:
          'Trade some of your own sanity for health. When cast, take the amount of madness gained.  Divide that number by two, recover that many hit points.  If the number is odd, round up to the nearest whole number',
      spellType: 2),
  const Spell(
      spellName: "Eldritch Eye",
      description:
          'Release a blast of overwhelming mental energy from the eyes to a target.  Target must make a Wisdom saving throw, 4d8 psychic damage if the target fail, 1d4 damage on target pass.',
      spellType: 1),
  const Spell(
      spellName: 'Self-Destructive',
      description:
          'Take the damage of the machination roll to your hit points, triple that damage to a target.  This spell cannot miss or be deflected',
      spellType: 2),
];
