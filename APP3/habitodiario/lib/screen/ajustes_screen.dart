import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/preferencias_model.dart';

class AjustesScreen
    extends StatelessWidget {
  const AjustesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prefs =
        context.watch<
            PreferenciasModel>();

    final nombreController =
        TextEditingController(
      text: prefs.nombreUsuario,
    );

    final metaController =
        TextEditingController(
      text:
          prefs.metaDiaria.toString(),
    );

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Ajustes"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller:
                  nombreController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Nombre",
              ),
            ),

            const SizedBox(height: 10),

            SwitchListTile(
              value: prefs.modoOscuro,
              title:
                  const Text("Modo oscuro"),
              onChanged: (value) {
                context
                    .read<
                        PreferenciasModel>()
                    .cambiarTema(
                        value);
              },
            ),

            TextField(
              controller:
                  metaController,
              keyboardType:
                  TextInputType.number,
              decoration:
                  const InputDecoration(
                labelText:
                    "Meta diaria",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final meta =
                    int.tryParse(
                        metaController
                            .text);

                if (meta != null &&
                    meta > 0) {
                  final p = context
                      .read<
                          PreferenciasModel>();

                  p.cambiarNombre(
                    nombreController
                        .text,
                  );

                  p.cambiarMeta(
                    meta,
                  );

                  Navigator.pop(
                      context);
                }
              },
              child:
                  const Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}