import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetopdm/main.dart';
import 'package:projetopdm/service/AuthService.dart';
import 'package:projetopdm/ui/pages/TelaHeros.dart';
import 'package:projetopdm/ui/pages/TelaRegister.dart';

class Telalogin extends StatefulWidget {
  const Telalogin({super.key});

  @override
  State<Telalogin> createState() => _TelaloginState();
}

class _TelaloginState extends State<Telalogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthService().getAuthStateChanges().listen((User? user) {
      if (user != null) {
        print('USUARIO ESTÁ LOGADO!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
  }

  Future<void> signIn() async {
    try {
      await AuthService().signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email e/ou Senha incorreto")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
              ElevatedButton(
                onPressed: () => {signIn()},
                child: Text("Entrar"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaRegister()),
                ),
                child: Text("Não tenho conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
