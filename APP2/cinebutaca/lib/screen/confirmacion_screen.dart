import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/sala_model.dart';

class ConfirmacionScreen extends StatelessWidget {
  const ConfirmacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sala =
        context.watch<SalaModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confirmar Reserva",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text(
              "Asientos: ${sala.seleccionados}",
              style:
                  const TextStyle(fontSize: 22),
            ),
            Text(
              "Total: Bs ${sala.total}",
              style:
                  const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context
                    .read<SalaModel>()
                    .confirmarReserva();

                Navigator.pop(context);
              },
              child: const Text(
                "Confirmar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
