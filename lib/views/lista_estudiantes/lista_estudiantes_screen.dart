import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taller_nav/views/base_view.dart';

class ListaEstudiantesScreen extends StatefulWidget {
  const ListaEstudiantesScreen({super.key});

  @override
  State<ListaEstudiantesScreen> createState() => _ListaEstudiantesScreenState();
}

class _ListaEstudiantesScreenState extends State<ListaEstudiantesScreen> {
  List<String> _nombres = [];

  @override
  void initState() {
    super.initState();
    obtenerDatos();
  }

  Future<List<String>> cargarNombres() async {
    await Future.delayed(const Duration(seconds: 5));
    return ['Juan', 'Pedro', 'Luis', 'Ana', 'Maria', 'Jose', 'Carlos'];
  }

  Future<void> obtenerDatos() async {
    final datos = await cargarNombres();
    if (!mounted) return;
    setState(() {
      _nombres = datos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Lista de Estudiantes',
      body:
          _nombres.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _nombres.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blueAccent,
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: Text(
                        _nombres[index],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
