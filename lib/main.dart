import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trailblaze/config/theme.dart';
import 'package:trailblaze/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const TrailBlazeApp());
}

class TrailBlazeApp extends StatelessWidget {
  const TrailBlazeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrailBlaze',
      theme: TrailBlazeTheme.lightTheme,
      darkTheme: TrailBlazeTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
