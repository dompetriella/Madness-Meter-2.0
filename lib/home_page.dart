import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/components/player_session_tile.dart';
import 'package:madness_meter_2/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.black,
          child: ref.watch(sessionIdProvider) < 1
              ? Center(child: CampaignLookup())
              : Center(
                  child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ))),
    ));
  }
}

class CampaignLookup extends HookConsumerWidget {
  const CampaignLookup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textEntry = useState('');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 200,
            height: 50,
            color: Colors.blue.shade800,
            child: TextField(
              inputFormatters: [UpperCaseTextFormatter()],
              style: TextStyle(fontSize: 32),
              decoration: InputDecoration(),
              textAlign: TextAlign.center,
            )),
        ElevatedButton(onPressed: () {
          
        }, child: Text('Press'))
      ],
    );
  }
}

getSessionId() {
  Supabase.instance.client.from('')
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

class Good extends StatelessWidget {
  const Good({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        }));
  }
}
