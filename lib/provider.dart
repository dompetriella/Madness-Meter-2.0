import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/Spell.dart';
import 'main.dart';

// change this to switch back to other screen for now
final sessionIdProvider = StateProvider<int>((ref) {
  return 1;
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

final madnessStreamProvider = StreamProvider<int>((ref) async* {
  final madnessStream = supabase.channel('public:player_session').on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(
        event: 'UPDATE',
        schema: 'public',
        table: 'player_session',
        filter: 'campaign_name=eq.vessel'),
    (payload, [reference]) {
      int newMadnessValue = payload['new']['madness_value'] as int;
      if (madnessMeterValue != newMadnessValue) {
        ref.read(madnessMeterValue.notifier).state = newMadnessValue;
      }
    },
  ).subscribe();
});
