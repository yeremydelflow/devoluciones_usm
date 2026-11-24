import 'package:devoluciones_usm/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GoogleSignInAccount? cuenta;
  // AuthCredential? credenciales;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [usmY,usmR,usmB],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Devoluciones USM', style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none
          ),),
          Divider(color: Colors.black,height: 50,),
          Container(
            padding: EdgeInsets.all(10),
            child:  FilledButton(
              onPressed: () async {
                try{
                  final cuenta = await GoogleSignIn.instance.authenticate();
                  final credenciales = GoogleAuthProvider.credential(idToken: cuenta.authentication.idToken);
                  await FirebaseAuth.instance.signInWithCredential(credenciales);
                } catch (e) {
                  debugPrint('Error: $e');
                }
              },
              child: Column(
                children: [
                  Text('iniciar sesion')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}