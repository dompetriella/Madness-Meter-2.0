import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/main.dart';
import 'package:madness_meter_2/provider.dart';

import 'models/player_session.dart';

setCurrentSessionId(int id, WidgetRef ref) {
  ref.watch(sessionIdProvider.notifier).state = id;
}

Future<PlayerSession> getSessionById(int id) async {
  final List<dynamic> session =
      await supabase.from('player_session').select('*').eq('id', id);
  PlayerSession idSession = PlayerSession.fromJson(session.firstOrNull);
  return idSession;
}

Future<PlayerSession> getSessionIdByName(String campaignName) async {
  final List<dynamic> session = await supabase
      .from('player_session')
      .select('*')
      .eq('campaign_Name', campaignName);
  PlayerSession idSession = PlayerSession.fromJson(session.firstOrNull);
  return idSession;
}

Future<int> getSessionMadness(int id) async {
  final List<dynamic> session =
      await supabase.from('player_session').select('*').eq('id', id);
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
