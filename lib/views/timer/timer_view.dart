import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taller_nav/views/custom_drawer.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  Timer? _timer;
  int _contador = 0;
  bool _activo = false;

  void _iniciarTemporizador() {
    if (_activo) return;
    _activo = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _contador++;
      });
    });
  }

  void _pausarTemporizador() {
    _timer?.cancel();
    _activo = false;
  }

  void _reiniciarTemporizador() {
    _timer?.cancel();
    setState(() {
      _contador = 0;
      _activo = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer - Contador')),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Segundos: $_contador', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _iniciarTemporizador,
                  child: const Text('Iniciar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _pausarTemporizador,
                  child: const Text('Pausar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _reiniciarTemporizador,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
