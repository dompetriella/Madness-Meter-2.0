import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madness_meter_2/db_functions.dart';
import 'package:madness_meter_2/home_page.dart';
import 'package:madness_meter_2/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: dotenv.env['BASE_URL'].toString(),
      anonKey: dotenv.env['API_KEY'].toString());
  runApp(ProviderScope(child: const MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initFunction = useCallback((_) async {
      int dbMadnessValue = await getMadnessValueInDb(ref, 'vessel');
      ref.read(madnessMeterValue.notifier).state = dbMadnessValue;
    }, []);

    useEffect(() {
      initFunction(null);
    }, []);

    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      theme: ThemeData(
        sliderTheme: SliderThemeData(
            trackHeight: 35,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 35)),
        textTheme: GoogleFonts.glassAntiquaTextTheme(textTheme).copyWith(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
