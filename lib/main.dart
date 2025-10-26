import 'package:archie/auth/auth_gate.dart';
import 'package:archie/controllers/page_provider.dart';
import 'package:archie/controllers/theme_provider.dart';
import 'package:archie/firebase_options.dart';
import 'package:archie/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MyApp(darkMode: value.darkMode),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.darkMode});
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: MaterialTheme(TextTheme()).lightHighContrast(),
      darkTheme: MaterialTheme(TextTheme()).darkHighContrast(),
      themeMode: (darkMode) ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
