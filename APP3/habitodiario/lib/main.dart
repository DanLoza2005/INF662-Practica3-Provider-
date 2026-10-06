import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/habitos_model.dart';
import 'models/preferencias_model.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HabitosModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferenciasModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final preferencias =
        context.watch<PreferenciasModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: preferencias.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}