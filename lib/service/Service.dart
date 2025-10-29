import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Service {
  Future<void> saveCard(Map<String, dynamic> carta, String name) async {
    //salva a carta no banco
    final user = FirebaseAuth.instance.currentUser; // se tiver autenticação
    final userId = user?.uid ?? "userId"; // use um ID fixo se não tiver login
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.collection('cards').doc(name).set(carta);
  }

  Future<QuerySnapshot> getCards() async {
    final user = FirebaseAuth.instance.currentUser; // se tiver autenticação
    final userId = user?.uid ?? "userId"; // use um ID fixo se não tiver login
    final userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cards');
    final snapshot = userRef.get();

    return snapshot;
  }

  Future<void> deleteCard(String name) async {
    final user = FirebaseAuth.instance.currentUser; // se tiver autenticação
    final userId = user?.uid ?? "userId"; // use um ID fixo se não tiver login
    final userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cards')
        .doc(name);
    userRef.delete();
  }
}
