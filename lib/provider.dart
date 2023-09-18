import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionIdProvider = StateProvider<int>((ref) {
  return 0;
});

final madnessMeterValue = StateProvider<int>((ref) {
  return 0;
});

final maxMadnessValue = StateProvider<int>((ref) {
  return 100;
});
