import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/sala_model.dart';
import 'screen/sala_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SalaModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineButaca',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const SalaScreen(),
    );
  }
}