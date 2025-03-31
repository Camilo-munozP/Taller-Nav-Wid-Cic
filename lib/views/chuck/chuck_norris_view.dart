import 'package:flutter/material.dart';
import 'package:taller_nav/views/custom_drawer.dart';
import '../../models/chuck_norris_joke.dart';
import '../../services/chuck_norris_service.dart';
import 'package:taller_nav/views/chuck/chuck_norris_dailt_view.dart';

class ChuckNorrisView extends StatefulWidget {
  const ChuckNorrisView({super.key});

  @override
  _ChuckNorrisViewState createState() => _ChuckNorrisViewState();
}

class _ChuckNorrisViewState extends State<ChuckNorrisView> {
  final ChuckNorrisService _service = ChuckNorrisService();
  late Future<List<ChuckNorrisJoke>> _jokes;

  @override
  void initState() {
    super.initState();
    _loadJokes();
  }

  void _loadJokes() {
    setState(() {
      _jokes = _service.getJokes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chistes de Chuck Norris')),
      drawer: const CustomDrawer(),
      body: FutureBuilder<List<ChuckNorrisJoke>>(
        future: _jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return _errorView();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _noDataView();
          }

          final jokes = snapshot.data!;
          return _jokesListView(jokes);
        },
      ),
    );
  }

  Widget _errorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 10),
          const Text(
            'No se pudieron cargar los chistes.\nVerifica tu conexión e intenta nuevamente.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
            onPressed: _loadJokes,
            icon: const Icon(Icons.refresh),
            label: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  Widget _noDataView() {
    return const Center(
      child: Text(
        'No hay chistes disponibles en este momento.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _jokesListView(List<ChuckNorrisJoke> jokes) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(jokes[index].iconUrl, width: 50, height: 50),
          title: Text(jokes[index].joke),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChuckNorrisDetailView(joke: jokes[index]),
              ),
            );
          },
        );
      },
    );
  }
}
