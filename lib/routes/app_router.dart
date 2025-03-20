import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_nav/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:taller_nav/views/home_view.dart';
import 'package:taller_nav/views/paso_parametros/detalle_screen.dart';
import 'package:taller_nav/views/paso_parametros/paso_parametros_screen.dart';
import 'package:taller_nav/views/grid_tab_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeView()),
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),
    GoRoute(
      path: '/detalle/:parametro/:metodo',
      builder: (context, state) {
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    GoRoute(
      path: '/grid_tab',
      builder: (context, state) => const GridTabView(),
    ),
  ],
);
