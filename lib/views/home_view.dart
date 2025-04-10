import 'package:flutter/material.dart';
import 'package:taller_nav/services/auth_service.dart';
import 'package:taller_nav/views/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'UCEVA',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('Bienvenido a la pantalla de inicio')),
          const SizedBox(height: 16),

          const SizedBox(height: 16),

          // Mostrar token desde SharedPreferences
          FutureBuilder<String?>(
            future: AuthService().getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return const Text('Error al cargar token');
              }

              final token = snapshot.data;
              return Text(
                'Token: ${token ?? "No hay token"}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
