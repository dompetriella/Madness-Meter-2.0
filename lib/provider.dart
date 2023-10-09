import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/spell.dart';

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

final availableSpellsProvider = StateProvider<List<Spell>>((ref) {
  return [];
});

final skullAnimationProvider = StateProvider<AnimationController?>((ref) {
  return null;
});
