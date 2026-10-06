import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/biblioteca_model.dart';

class MiListaScreen extends StatelessWidget {
  const MiListaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Lista"),
      ),
      body: Consumer<BibliotecaModel>(
        builder: (context, biblioteca, child) {
          if (biblioteca.miLista.isEmpty) {
            return const Center(
              child: Text(
                "No hay libros agregados",
              ),
            );
          }

          return ListView.builder(
            itemCount: biblioteca.miLista.length,
            itemBuilder: (context, index) {
              final libro =
                  biblioteca.miLista[index];

              return ListTile(
                title: Text(libro.titulo),
                subtitle: Text(libro.autor),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context
                        .read<BibliotecaModel>()
                        .quitar(libro);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}