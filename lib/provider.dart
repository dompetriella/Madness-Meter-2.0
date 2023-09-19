import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/main.dart';

import 'models/Spell.dart';

// change this to switch back to other screen for now
final sessionIdProvider = StateProvider<int>((ref) {
  return 0;
});

final madnessMeterValue = StateProvider<int>((ref) {
  return 0;
});

final maxMadnessValue = StateProvider<int>((ref) {
  return 100;
});

final castedSpellsListProvider = StateProvider<List<Spell>>((ref) {
  return [];
});
