import 'package:capsule_map/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  static auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String> signUp(
      String email, String password, String username) async {
    QuerySnapshot users = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    if (users.size != 0) {
      return 'Username is in use';
    } else {
      try {
        auth.UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        User user = User(
            username: username,
            capsules: [],
            friends: [],
            friendCapsules: [],
            friendCapsulesOpened: []);

        await _firestore
            .collection('users')
            .doc(userCredential.user.uid)
            .set(user.toJson());

        return '';
      } catch (error) {
        return error.toString();
      }
    }
  }

  static Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return '';
    } catch (error) {
      return error.toString();
    }
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
