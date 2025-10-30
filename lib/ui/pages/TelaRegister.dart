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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Conta criada!"),
          duration: Duration(seconds: 1),
        ),
      );

      print("user");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao criar conta"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 0, 0),
      appBar: AppBar(title: Text("Register"), automaticallyImplyLeading: false),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
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
