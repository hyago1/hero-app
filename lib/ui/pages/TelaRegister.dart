import 'package:flutter/material.dart';
import 'package:projetopdm/main.dart';
import 'package:projetopdm/service/AuthService.dart';
import 'package:projetopdm/ui/pages/TelaLogin.dart';

class TelaRegister extends StatefulWidget {
  const TelaRegister({super.key});

  @override
  State<TelaRegister> createState() => _TelaRegisterState();
}

class _TelaRegisterState extends State<TelaRegister> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      await AuthService().signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Conta criada!")));

      print("user");
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao criar conta")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
                onPressed: () => {signUp()},
                child: Text("Criar conta"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Telalogin()),
                ),
                child: Text("Tenho conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
