import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madness_meter_2/main.dart';
import 'package:madness_meter_2/provider.dart';

updateMadnessValueInDb(int amount, WidgetRef ref, String campaignName) async {
  await supabase.from('player_session').update({
    'madness_value': ref.watch(madnessMeterValue),
  }).eq('campaign_name', campaignName);
}

Future<int> getMadnessValueInDb(WidgetRef ref, String campaignName) async {
  List<dynamic> response = await supabase
      .from('player_session')
      .select('madness_value')
      .eq('campaign_name', campaignName);

  return response.first['madness_value'];
}

Future<int> retrieveSessionIdByName(String campaignName) async {
  final List<dynamic> sessionId = await supabase
      .from('player_session')
      .select('id')
      .eq('campaign_name', campaignName.toLowerCase());
  return sessionId.first['id'];
}

setCurrentSessionId(int id, WidgetRef ref) {
  ref.watch(sessionIdProvider.notifier).state = id;
}
