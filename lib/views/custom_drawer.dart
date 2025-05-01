import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_nav/services/auth_service.dart';
import 'package:taller_nav/models/user.dart';

class CustomDrawer extends StatelessWidget {
  final User? user; // Se recibe el usuario como parámetro

  const CustomDrawer({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.name ?? 'Usuario desconocido',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 4),
                Text(
                  user?.email ?? '',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
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
            leading: const Icon(Icons.store),
            title: const Text('Establecimientos'),
            onTap: () {
              context.go('/establecimientos');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {
              context.go('/timer');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Isolate'),
            onTap: () {
              context.go('/isolate');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Paso de Parámetros'),
            onTap: () {
              context.go('/paso_parametros');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text('Ciclo de Vida'),
            onTap: () {
              context.go('/ciclo_vida');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('GridView, TabBar y Lista'),
            onTap: () {
              context.go('/grid_tab');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Lista de Estudiantes'),
            onTap: () {
              context.go('/lista_estudiantes');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mood),
            title: const Text('Chuck Norris Jokes'),
            onTap: () {
              context.go('/chuck');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Iniciar sesión'),
            onTap: () {
              context.goNamed('login');
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () async {
              final token = await AuthService().getToken();

              if (token != null) {
                await AuthService().logout();

                if (!context.mounted) {
                  return;
                }
                context.go('/login');
              } else {
                if (!context.mounted) return;
                Navigator.pop(context); // Cierra el drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No hay sesión activa.')),
                );
              }
            },
          ),
          //! ruta para cambiar el tema
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Cambiar tema'),
            onTap: () {
              context.pushNamed('cambiar_tema');
            },
          ),
        ],
      ),
    );
  }
}
