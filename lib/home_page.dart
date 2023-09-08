import 'package:flutter/material.dart';
import 'package:madness_meter_2/components/player_session_tile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: Supabase.instance.client
                  .from('player_session')
                  .select<List<Map<String, dynamic>>>(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                var data = snapshot.data!;
                return Wrap(
                  children: data
                      .map((item) => PlayerSessionTile(
                            id: item['id'],
                            campaignName: item['campaign_name'],
                            madnessValue: item['madness_value'],
                            maxMadnessValue: item['max_madness_value'],
                          ))
                      .toList()
                      .cast<Widget>(),
                );
              }))),
    );
  }
}
