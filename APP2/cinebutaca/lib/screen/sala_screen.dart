import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/asiento.dart';
import '../models/sala_model.dart';
import 'confirmacion_screen.dart';

class SalaScreen extends StatelessWidget {
  const SalaScreen({super.key});

  Color colorAsiento(
      EstadoAsiento estado) {
    switch (estado) {
      case EstadoAsiento.libre:
        return Colors.green;

      case EstadoAsiento.seleccionado:
        return Colors.orange;

      case EstadoAsiento.ocupado:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CineButaca"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 48,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          return Selector<
              SalaModel,
              EstadoAsiento>(
            selector: (context, sala) =>
                sala.obtenerEstado(
                    index),
            builder:
                (context, estado, child) {
              return GestureDetector(
                onTap: () {
                  final ok = context
                      .read<SalaModel>()
                      .seleccionar(
                          index);

                  final sala = context
                      .read<SalaModel>();

                  if (!ok &&
                      sala.seleccionados >=
                          6) {
                    ScaffoldMessenger.of(
                            context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Máximo 6 asientos",
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin:
                      const EdgeInsets.all(4),
                  decoration:
                      BoxDecoration(
                    color: colorAsiento(
                        estado),
                    borderRadius:
                        BorderRadius
                            .circular(8),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar:
          Selector<SalaModel, int>(
        selector: (context, sala) =>
            sala.seleccionados,
        builder:
            (context, cantidad, child) {
          final total = context
              .watch<SalaModel>()
              .total;

          return Container(
            padding:
                const EdgeInsets.all(16),
            height: 90,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Text(
                  "$cantidad asientos",
                  style:
                      const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Bs $total",
                  style:
                      const TextStyle(
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: cantidad == 0
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const ConfirmacionScreen(),
                            ),
                          );
                        },
                  child:
                      const Text("Reservar"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}