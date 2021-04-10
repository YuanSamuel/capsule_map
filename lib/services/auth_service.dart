import 'package:capsule_map/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUp(String email, String password, String username) async {
    QuerySnapshot users = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    if (users.size == 0) {
      return 'Username is in use';
    } else {
      auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = User(
          username: username,
          capsules: [],
          friends: [],
          friendCapsules: [],
          friendCapsulesOpened: []);

      _firestore
          .collection('users')
          .doc(userCredential.user.uid)
          .set(user.toJson());

      return '';
    }
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
