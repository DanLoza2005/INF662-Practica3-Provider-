import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/habitos_model.dart';
import '../models/preferencias_model.dart';
import 'agregar_habito_screen.dart';
import 'ajustes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitos =
        context.watch<HabitosModel>();

    final prefs =
        context.watch<PreferenciasModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hábito Diario",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const AjustesScreen(),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AgregarHabitoScreen(),
            ),
          );
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          Text(
            "Hola ${prefs.nombreUsuario}",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),

          Text(
            "Progreso: ${(habitos.porcentaje * 100).toStringAsFixed(0)}%",
          ),

          if (habitos
                  .habitos
                  .where((h) => h.cumplido)
                  .length >=
              prefs.metaDiaria)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "✅ Meta alcanzada",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
            ),

          Expanded(
            child: ListView.builder(
              itemCount:
                  habitos.habitos.length,
              itemBuilder:
                  (context, index) {
                final habito =
                    habitos.habitos[index];

                return CheckboxListTile(
                  title: Text(
                    habito.nombre,
                  ),
                  subtitle: Text(
                    habito.categoria,
                  ),
                  value: habito.cumplido,
                  onChanged: (_) {
                    context
                        .read<
                            HabitosModel>()
                        .cambiarEstado(
                            index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}