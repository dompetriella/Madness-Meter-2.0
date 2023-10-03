import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/db_functions.dart';
import 'package:madness_meter_2/models/madness_type.dart';
import 'models/spell.dart';
import 'provider.dart';

castMadnessSpell(WidgetRef ref, Spell spell) {
  var currentMeter = ref.watch(madnessMeterValue);
  var rng = Random();
  var increaseAmount =
      rng.nextInt(MadnessType.values[spell.spellType].rollValue) + 1;
  updateSessionMadnessValue(ref.read(sessionIdProvider), increaseAmount);

  if (!ref.read(castedSpellsListProvider).contains(spell)) {
    ref.read(castedSpellsListProvider.notifier).state = [
      ...ref.read(castedSpellsListProvider),
      spell
    ];
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

Color percentageToHsl(double percent, int hue0, int hue1, double lightness) {
  var percentFilled = percent;
  if (percent >= 1) {
    percentFilled = 1;
  }
  double returnHue = ((percentFilled * (hue1 - hue0)) + hue0);
  return HSLColor.fromAHSL(1, returnHue, 1, lightness).toColor();
}

double madnessAsPercent(WidgetRef ref) {
  double percent = ref.watch(madnessMeterValue) / ref.watch(maxMadnessValue);
  if (percent > 1) {
    percent = 1;
  }
  return percent;
}
