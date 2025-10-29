import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:projetopdm/service/AuthService.dart';
import 'package:projetopdm/ui/pages/TelaBattle.dart';
import 'package:projetopdm/ui/pages/TelaHeros.dart';
import 'package:projetopdm/ui/pages/TelaDailyCards.dart';
import 'package:projetopdm/ui/pages/TelaLogin.dart';
import 'package:projetopdm/ui/pages/TelaMyCards.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetopdm/ui/pages/TelaRegister.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: const Telalogin(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  late var emailUser = "user";

  @override
  void initState() {
    getEmail();
    super.initState();
  }

  Future<void> getEmail() async {
    String email = await AuthService().getCurrentUserEmail();
    setState(() {
      emailUser = email;
    });
  }

  final List<Widget> frames = <Widget>[
    TelaHeros(),
    TelaDailyCards(),
    TelaMyCards(),
    TelaBattle(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Projeto PDM - Hero"),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.person),
            onSelected: (String result) {
              print('Selected: $result');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(value: 'User', child: Text(emailUser)),
              PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Sair'),
                onTap: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Telalogin()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Center(child: frames.elementAt(pageIndex)),
      bottomNavigationBar: NavigationBar(
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Heros',
          ),
          NavigationDestination(
            icon: Icon(Icons.today),
            selectedIcon: Icon(Icons.today_sharp),
            label: 'Card Diário',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.credit_card_rounded),
            ),
            label: 'Meus Cards',
          ),
          NavigationDestination(
            icon: Icon(Icons.shield_outlined),
            label: 'Batalhar',
          ),
        ],
        selectedIndex: pageIndex,
        onDestinationSelected: (value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
    );
  }
}
