import 'package:devoluciones_usm/pages/nav_lista.dart';
import 'package:devoluciones_usm/pages/nav_lista_propia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaSeleccionada = 0;
  final List<Widget> _paginas =[
    NavLista(),
    NavListaPropia()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Devoluciones USM', style: TextStyle(color: Colors.white, fontSize: 22) ,),
      ),
      body: IndexedStack(index: _paginaSeleccionada, children: _paginas,),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(MdiIcons.ambulance), label: 'lista'),
        NavigationDestination(icon: Icon(MdiIcons.ambulance), label: 'lista propia'),
      ],
      selectedIndex: _paginaSeleccionada,
      onDestinationSelected: (indicePagina) {
        setState(() {
          _paginaSeleccionada = indicePagina;
        });
      },
      ),
    );
  }
}