import 'package:flutter/material.dart';

class PreferenciasModel
    extends ChangeNotifier {
  String nombreUsuario = "Daniel";

  bool modoOscuro = false;

  int metaDiaria = 3;

  void cambiarNombre(String nombre) {
    nombreUsuario = nombre;
    notifyListeners();
  }

  void cambiarTema(bool valor) {
    modoOscuro = valor;
    notifyListeners();
  }

  void cambiarMeta(int meta) {
    metaDiaria = meta;
    notifyListeners();
  }

  ThemeMode get themeMode =>
      modoOscuro
          ? ThemeMode.dark
          : ThemeMode.light;
}