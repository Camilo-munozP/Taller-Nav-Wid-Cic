import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const BaseView({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const CustomDrawer(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
