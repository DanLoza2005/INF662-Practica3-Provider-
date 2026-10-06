class Habito {
  String nombre;
  String categoria;
  bool cumplido;

  Habito({
    required this.nombre,
    required this.categoria,
    this.cumplido = false,
  });
}