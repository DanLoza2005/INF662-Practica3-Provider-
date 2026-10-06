import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/biblioteca_model.dart';
import 'screen/catalogo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BibliotecaModel(),
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
      title: 'Mi Biblioteca',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: CatalogoScreen(),
    );
  }
}