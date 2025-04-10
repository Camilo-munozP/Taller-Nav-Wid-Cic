import 'package:flutter/material.dart';
import 'package:taller_nav/models/establecimiento.dart';
import 'package:taller_nav/services/establecimiento_services.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_nav/views/base_view.dart';

class EstablecimientosListView extends StatefulWidget {
  const EstablecimientosListView({super.key});

  @override
  EstablecimientosListViewState createState() =>
      EstablecimientosListViewState();
}

class EstablecimientosListViewState extends State<EstablecimientosListView> {
  final EstablecimientoService _service = EstablecimientoService();
  late Future<List<Establecimiento>> _future;

  @override
  void initState() {
    super.initState();
    _future = _service.getEstablecimientos();
  }

  Future<void> _goToEdit(int id) async {
    final result = await context.push('/establecimientos/edit/$id');

    if (result == true) {
      setState(() {
        _future = _service.getEstablecimientos();
      });
    }
  }

  //! Método para eliminar un establecimiento
  Future<void> _deleteEstablecimiento(int id) async {
    bool eliminado = await _service.deleteEstablecimiento(id);
    if (eliminado) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Establecimiento eliminado correctamente')),
      );
      setState(() {
        _future = _service.getEstablecimientos(); // Recarga la lista
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el establecimiento')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Establecimientos',
      body: FutureBuilder<List<Establecimiento>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay establecimientos disponibles'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final establecimiento = snapshot.data![index];
              return Card(
                margin: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child:
                            establecimiento.logo.isNotEmpty
                                ? Image.network(
                                  '${_service.baseUrlImg}${establecimiento.logo}',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )
                                : Icon(Icons.image_not_supported, size: 80),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              establecimiento.nombre,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('NIT: ${establecimiento.nit}'),
                            Text('Dirección: ${establecimiento.direccion}'),
                            Text('Teléfono: ${establecimiento.telefono}'),
                          ],
                        ),
                      ),
                      //! Botón para eliminar
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed:
                            () => _deleteEstablecimiento(establecimiento.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      //! AGREGAMOS AQUÍ EL BOTÓN FLOTANTE
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push('/establecimientos/create');
          if (result == true) {
            setState(() {
              _future = _service.getEstablecimientos(); // Recargar lista
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
