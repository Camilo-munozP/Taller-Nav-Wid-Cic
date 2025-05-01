import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_nav/provider/theme_provider.dart';

class ChangeThemeView extends StatelessWidget {
  const ChangeThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentColor = themeProvider.color;

    final List<Color> availableColors = [
      const Color.fromARGB(255, 20, 83, 165),
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.teal,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cambiar tema')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Color principal del tema'),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children:
                  availableColors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        themeProvider.setColor(color);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                          border: Border.all(
                            color:
                                currentColor == color
                                    ? Colors.black
                                    : Colors.transparent,
                            width: 4,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
