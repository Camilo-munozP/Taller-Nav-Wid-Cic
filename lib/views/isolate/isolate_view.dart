import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:taller_nav/views/custom_drawer.dart';

class IsolateView extends StatefulWidget {
  const IsolateView({super.key});

  @override
  State<IsolateView> createState() => _IsolateViewState();
}

class _IsolateViewState extends State<IsolateView> {
  String resultado = "Presiona el botón para ejecutar la tarea pesada";
  bool _isRunning = false; // Variable para evitar múltiples ejecuciones

  Future<void> isolateTask() async {
    if (_isRunning)
      return; // Evitar que el usuario ejecute la tarea varias veces
    _isRunning = true;

    final receivePort = ReceivePort();
    await Isolate.spawn(_simulacionTareaPesada, receivePort.sendPort);
    final sendPort = await receivePort.first as SendPort;
    final response = ReceivePort();
    sendPort.send(response.sendPort);
    final result = await response.first as String;
    if (!mounted) return;
    setState(() {
      resultado = result;
    });
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Tarea finalizada: $resultado')));
    }
    _isRunning = false;
  }

  static void _simulacionTareaPesada(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final message in port) {
      final responsePort = message as SendPort;

      int sum = 0;
      for (int i = 1; i <= 2000000; i++) {
        sum += i;

        // Mostrar progreso en consola cada 500,000 iteraciones
        if (i % 500000 == 0) {
          print("Progreso: $i números sumados...");
        }
      }

      print("Tarea pesada finalizada. Suma total: $sum");
      responsePort.send("Suma total: $sum");
      port.close();
      Isolate.exit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tarea Pesada con Isolate")),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(resultado, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isolateTask,
              child: const Text("Ejecutar tarea en segundo plano"),
            ),
          ],
        ),
      ),
    );
  }
}
