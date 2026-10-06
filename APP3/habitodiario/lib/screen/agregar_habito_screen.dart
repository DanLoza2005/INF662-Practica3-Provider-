import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/habitos_model.dart';

class AgregarHabitoScreen
    extends StatefulWidget {
  const AgregarHabitoScreen({
    super.key,
  });

  @override
  State<AgregarHabitoScreen>
      createState() =>
          _AgregarHabitoScreenState();
}

class _AgregarHabitoScreenState
    extends State<
        AgregarHabitoScreen> {
  final formKey = GlobalKey<FormState>();

  final nombreController =
      TextEditingController();

  String? categoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nuevo Hábito",
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller:
                    nombreController,
                decoration:
                    const InputDecoration(
                  labelText: "Nombre",
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return "Ingrese nombre";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<
                  String>(
                decoration:
                    const InputDecoration(
                  labelText:
                      "Categoría",
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Salud",
                    child:
                        Text("Salud"),
                  ),
                  DropdownMenuItem(
                    value:
                        "Estudio",
                    child:
                        Text("Estudio"),
                  ),
                  DropdownMenuItem(
                    value:
                        "Deporte",
                    child:
                        Text("Deporte"),
                  ),
                ],
                onChanged: (value) {
                  categoria = value;
                },
                validator: (value) {
                  if (value == null) {
                    return "Seleccione una categoría";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (formKey
                      .currentState!
                      .validate()) {
                    context
                        .read<
                            HabitosModel>()
                        .agregarHabito(
                          nombreController
                              .text,
                          categoria!,
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
      ),
    );
  }
}