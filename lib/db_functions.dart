import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/main.dart';
import 'package:madness_meter_2/provider.dart';

import 'models/player_session.dart';
import 'models/spell.dart';

setCurrentSessionId(int id, WidgetRef ref) {
  ref.watch(sessionIdProvider.notifier).state = id;
}

Future<PlayerSession> getSessionById(int id) async {
  final List<dynamic> session =
      await supabase.from('player_session').select().eq('id', id);
  PlayerSession idSession = PlayerSession.fromJson(session.firstOrNull);
  return idSession;
}

Future<PlayerSession> getSessionIdByName(String campaignName) async {
  final List<dynamic> session = await supabase
      .from('player_session')
      .select()
      .eq('campaign_name', campaignName);
  PlayerSession idSession = PlayerSession.fromJson(session.firstOrNull);
  return idSession;
}

Future<int> getSessionMadness(int id) async {
  final List<dynamic> session =
      await supabase.from('player_session').select().eq('id', id);
  PlayerSession idSession = PlayerSession.fromJson(session.firstOrNull);
  return idSession.madnessValue;
}

void updateSessionMadnessValue(int id, int changeAmount) async {
  int currentValue = await getSessionMadness(id);
  int newValue =
      currentValue + changeAmount < 0 ? 0 : currentValue + changeAmount;
  await supabase.from('player_session').update({
    'madness_value': newValue,
  }).eq('id', id);
}

Future<List<PlayerSession>> getPlayerSessions() async {
  final List<dynamic> data = await supabase.from('player_session').select('*');
  final List<PlayerSession> playerSessions =
      data.map((e) => PlayerSession.fromJson(e)).toList();
  playerSessions.sort((a, b) => a.id.compareTo(b.id));
  return playerSessions;
}

Future<List<Spell>> getAllSpells() async {
  final List<dynamic> allSpells =
      await supabase.from('madness_spells').select();
  return allSpells.map((e) => Spell.fromJson(e)).toList();
}

Future getAvailableSpellsInState(WidgetRef ref) async {
  int id = ref.read(sessionIdProvider);

  List<Spell> allSpells = await getAllSpells();
  List<Spell> availableSpells = allSpells
      .where((element) => element.availableCampaigns.contains(id))
      .toList();
  ref.read(availableSpellsProvider.notifier).state = availableSpells;
  await supabase.from('player_session').update({
    'new_spells_available': false,
  }).eq('id', id);
}
