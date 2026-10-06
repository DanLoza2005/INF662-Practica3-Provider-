import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/biblioteca_model.dart';
import '../models/libro.dart';
import 'mi_lista_screen.dart';

class CatalogoScreen extends StatelessWidget {
  CatalogoScreen({super.key});

  final List<Libro> catalogo = [
    const Libro(
      titulo: "Clean Code",
      autor: "Robert Martin",
      genero: "Programación",
      anio: 2008,
    ),
    const Libro(
      titulo: "Flutter in Action",
      autor: "Eric Windmill",
      genero: "Tecnología",
      anio: 2020,
    ),
    const Libro(
      titulo: "1984",
      autor: "George Orwell",
      genero: "Ficción",
      anio: 1949,
    ),
    const Libro(
      titulo: "Dune",
      autor: "Frank Herbert",
      genero: "Ciencia Ficción",
      anio: 1965,
    ),
    const Libro(
      titulo: "Harry Potter",
      autor: "J.K. Rowling",
      genero: "Fantasía",
      anio: 1997,
    ),
    const Libro(
      titulo: "El Principito",
      autor: "Antoine de Saint-Exupéry",
      genero: "Infantil",
      anio: 1943,
    ),
    const Libro(
      titulo: "Sapiens",
      autor: "Yuval Harari",
      genero: "Historia",
      anio: 2014,
    ),
    const Libro(
      titulo: "Hábitos Atómicos",
      autor: "James Clear",
      genero: "Desarrollo Personal",
      anio: 2018,
    ),
    const Libro(
      titulo: "Steve Jobs",
      autor: "Walter Isaacson",
      genero: "Biografía",
      anio: 2011,
    ),
    const Libro(
      titulo: "Don Quijote",
      autor: "Miguel de Cervantes",
      genero: "Novela",
      anio: 1605,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cantidad =
        context.watch<BibliotecaModel>().cantidad;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo"),
        actions: [
          IconButton(
            icon: Badge(
              label: Text("$cantidad"),
              child: const Icon(Icons.library_books),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const MiListaScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: catalogo.length,
        itemBuilder: (context, index) {
          final libro = catalogo[index];

          final agregado = context
              .watch<BibliotecaModel>()
              .contiene(libro);

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(libro.titulo),
              subtitle: Text(
                "${libro.autor} (${libro.anio})",
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  final biblioteca =
                      context.read<BibliotecaModel>();

                  if (agregado) {
                    biblioteca.quitar(libro);
                  } else {
                    biblioteca.agregar(libro);
                  }
                },
                child: Text(
                  agregado
                      ? "Quitar"
                      : "Agregar",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}