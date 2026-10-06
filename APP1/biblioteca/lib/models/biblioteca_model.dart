import 'dart:collection';
import 'package:flutter/material.dart';
import 'libro.dart';

class BibliotecaModel extends ChangeNotifier {
  final List<Libro> _miLista = [];

  UnmodifiableListView<Libro> get miLista =>
      UnmodifiableListView(_miLista);

  int get cantidad => _miLista.length;

  void agregar(Libro libro) {
    if (!_miLista.contains(libro)) {
      _miLista.add(libro);
      notifyListeners();
    }
  }

  void quitar(Libro libro) {
    _miLista.remove(libro);
    notifyListeners();
  }

  bool contiene(Libro libro) {
    return _miLista.contains(libro);
  }
}

