import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Taller - Home')),
      drawer: const CustomDrawer(), //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            ElevatedButton(
              onPressed: () => context.go('/paso_parametros'),
              child: const Text('Paso de Parámetros'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/ciclo_vida'),
              child: const Text('Ciclo de Vida de un StatefulWidget'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/grid_tab'),
              child: const Text('GridView, TabBar y Lista'),
            ),*/
          ],
        ),
      ),
    );
  }
}
