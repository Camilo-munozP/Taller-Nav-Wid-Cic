import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_nav/views/Timer/timer_view.dart';
import 'package:taller_nav/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:taller_nav/views/home_view.dart';
import 'package:taller_nav/views/paso_parametros/detalle_screen.dart';
import 'package:taller_nav/views/paso_parametros/paso_parametros_screen.dart';
import 'package:taller_nav/views/grid_tab_view.dart';
import 'package:taller_nav/views/lista_estudiantes/lista_estudiantes_screen.dart';
import 'package:taller_nav/views/isolate/isolate_view.dart';
import 'package:taller_nav/views/chuck/chuck_norris_view.dart';
import 'package:taller_nav/views/establecimientos/establecimiento_list_view.dart';
import 'package:taller_nav/views/establecimientos/establecimiento_create_views.dart';
import 'package:taller_nav/views/establecimientos/establecimiento_edit_view.dart';
import 'package:taller_nav/views/auth/login_page.dart';
import 'package:taller_nav/views/auth/register_page.dart';
import 'package:taller_nav/views/profile_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeView()),

    // Ruta para la lista de establecimientos
    GoRoute(
      path: '/establecimientos',
      builder: (context, state) => const EstablecimientosListView(),
    ),

    // Ruta para crear un establecimiento
    GoRoute(
      path: '/establecimientos/create',
      builder: (context, state) => const EstablecimientoCreateView(),
    ),

    // Ruta para editar un establecimiento (recibe un ID)
    GoRoute(
      path: '/establecimientos/edit/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return EstablecimientoEditView(id: id);
      },
    ),

    // Otras rutas
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
    GoRoute(
      path: '/lista_estudiantes',
      builder: (context, state) => const ListaEstudiantesScreen(),
    ),
    GoRoute(path: '/timer', builder: (context, state) => const TimerView()),
    GoRoute(path: '/isolate', builder: (context, state) => const IsolateView()),
    GoRoute(
      path: '/chuck',
      builder: (context, state) => const ChuckNorrisView(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
