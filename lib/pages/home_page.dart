import 'package:devoluciones_usm/constants.dart';
import 'package:devoluciones_usm/pages/nav_lista.dart';
import 'package:devoluciones_usm/pages/nav_lista_propia.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  User? user;
  
  @override
  void initState(){
    super.initState();
      if (!mounted) return;
      setState(() {
        user = FirebaseAuth.instance.currentUser;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: usmB,
        title: Text('Devoluciones USM', style: TextStyle(color: Colors.white, fontSize: 22) ,),
        actions: [
          PopupMenuButton(
            onSelected: (value) => FirebaseAuth.instance.signOut(),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                    children: [
                      Icon(MdiIcons.account),
                      Text(user?.displayName ?? "Cargando..."),
                    ],
                  ),
              ),
              PopupMenuItem(
                value: 'logout',
                child:
                  Row(
                    children: [
                      Text('cerrar sesion'),
                      Icon(MdiIcons.exitToApp, color: usmR,)
                    ]
                  )
              )
            ],
          )
        ],
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