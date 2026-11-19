import 'package:flutter/material.dart';

class NavLista extends StatelessWidget {
  const NavLista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Text('lista'),
        
        Expanded(child: ListView(
          children: [
            ListTile(
              leading: Column(
                children: [
                  Text('nombre usuario'),
                  Text('fecha de subida')
                ],
              ),
              title: Text('foto'),
              trailing: Column(
                children: [
                  Text('solicitar objeto'),
                  Text('detalles'),
                ],
              ),
              subtitle: Column(
                children: [
                  Text('nombre del objeto'),
                  Text('donde se encontro')
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Column(
                children: [
                  Text('nombre usuario'),
                  Text('fecha de subida')
                ],
              ),
              title: Text('foto'),
              trailing: Column(
                children: [
                  Text('solicitar objeto'),
                  Text('detalles'),
                ],
              ),
              subtitle: Column(
                children: [
                  Text('nombre del objeto'),
                  Text('donde se encontro')
                ],
              ),
            )
          ],
        ))
        ],
    ),);
  }
}