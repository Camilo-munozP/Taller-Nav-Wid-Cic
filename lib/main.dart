// main.dart
import 'package:flutter/material.dart';
import 'package:taller_nav/routes/app_router.dart';
import 'themes/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //! Importante para que funcione el dotenv, inicializa el widget

  //!carga el archivo .env en la raiz del proyecto
  await dotenv.load(fileName: ".env");

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
