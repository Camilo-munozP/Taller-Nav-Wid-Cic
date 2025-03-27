import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {
              context.go('/timer');
            },
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Isolate'),
            onTap: () {
              context.go('/isolate');
            },
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Paso de Parámetros'),
            onTap: () {
              context.go('/paso_parametros');
            },
          ),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text('Ciclo de Vida'),
            onTap: () {
              context.go('/ciclo_vida');
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('GridView, TabBar y Lista'),
            onTap: () {
              context.go('/grid_tab');
            },
          ),
          ListTile(
            leading: const Icon(Icons.school), //
            title: const Text('Lista de Estudiantes'),
            onTap: () {
              context.go('/lista_estudiantes'); //
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
