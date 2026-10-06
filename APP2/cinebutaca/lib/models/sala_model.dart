import 'package:flutter/material.dart';

import 'asiento.dart';

class SalaModel extends ChangeNotifier {
  static const int filas = 6;
  static const int columnas = 8;

  final List<EstadoAsiento> asientos =
      List.generate(
    filas * columnas,
    (_) => EstadoAsiento.libre,
  );

  final double precio = 35;

  int get seleccionados =>
      asientos.where(
        (e) => e == EstadoAsiento.seleccionado,
      ).length;

  double get total =>
      seleccionados * precio;

  EstadoAsiento obtenerEstado(int index) {
    return asientos[index];
  }

  bool seleccionar(int index) {
    if (asientos[index] ==
        EstadoAsiento.ocupado) {
      return false;
    }

    if (asientos[index] ==
        EstadoAsiento.seleccionado) {
      asientos[index] =
          EstadoAsiento.libre;

      notifyListeners();
      return true;
    }

    if (seleccionados >= 6) {
      return false;
    }

    asientos[index] =
        EstadoAsiento.seleccionado;

    notifyListeners();

    return true;
  }

  void confirmarReserva() {
    for (int i = 0; i < asientos.length; i++) {
      if (asientos[i] ==
          EstadoAsiento.seleccionado) {
        asientos[i] = EstadoAsiento.ocupado;
      }
    }

    notifyListeners();
  }
}