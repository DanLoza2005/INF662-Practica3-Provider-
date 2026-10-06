import 'package:flutter/material.dart';
import 'habito.dart';

class HabitosModel extends ChangeNotifier {
  final List<Habito> _habitos = [];

  List<Habito> get habitos => _habitos;

  void agregarHabito(
    String nombre,
    String categoria,
  ) {
    _habitos.add(
      Habito(
        nombre: nombre,
        categoria: categoria,
      ),
    );

    notifyListeners();
  }

  void cambiarEstado(int index) {
    _habitos[index].cumplido =
        !_habitos[index].cumplido;

    notifyListeners();
  }

  double get porcentaje {
    if (_habitos.isEmpty) return 0;

    int cumplidos = _habitos
        .where((h) => h.cumplido)
        .length;

    return cumplidos / _habitos.length;
  }
}