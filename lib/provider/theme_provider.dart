import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  Color _color = const Color.fromARGB(255, 20, 83, 165);
  ThemeMode _themeMode = ThemeMode.light;

  Color get color => _color;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Cargar color
    final colorGuardado = prefs.getString('color');
    if (colorGuardado != null) {
      _color = Color(int.parse(colorGuardado));
    }

    // Cargar modo de tema
    final modo = prefs.getString('themeMode');
    if (modo != null) {
      _themeMode = modo == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    notifyListeners();
  }

  Future<void> setColor(Color newColor) async {
    _color = newColor;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('color', newColor.value.toString());
  }

  Future<void> toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', isDark ? 'dark' : 'light');
  }
}
