// main.dart
import 'package:flutter/material.dart';
import 'package:taller_nav/routes/app_router.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter - Taller',
      routerConfig: appRouter, // Configuración de rutas centralizada
      theme: AppTheme.lightTheme, // Tema personalizado
    );
  }
}
