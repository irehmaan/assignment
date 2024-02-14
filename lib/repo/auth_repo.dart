import 'package:firebase_auth/firebase_auth.dart';

class Auth_Repo {
  final _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPass(String email, String pass) async {
    try {
      final creds =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return creds.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return null;
    }
  }

  void signOutUser() async {
    await _auth.signOut();
  }
}
