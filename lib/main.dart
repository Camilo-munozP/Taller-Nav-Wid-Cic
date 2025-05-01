// main.dart
import 'package:flutter/material.dart';
import 'package:taller_nav/routes/app_router.dart';
import 'themes/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:taller_nav/provider/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //! Importante para que funcione el dotenv, inicializa el widget

  //!carga el archivo .env en la raiz del proyecto
  await dotenv.load(fileName: ".env");

  runApp(
    //!multiprovider permite usar varios providers en la app
    //! en este caso solo se usa el ThemeProvider, pero se pueden agregar más
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //* El provider se encarga de gestionar el color del tema de la app
          //* y notificar a los widgets que lo usan cuando cambia
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //! Obtiene el color actual del ThemeProvider
    final themeColor = Provider.of<ThemeProvider>(context).color;
    return MaterialApp.router(
      theme: AppTheme.lightTheme(themeColor),
      title: 'Flutter - Taller',
      routerConfig: appRouter, // Configuración de rutas centralizada
      // Tema personalizado
    );
  }
}
