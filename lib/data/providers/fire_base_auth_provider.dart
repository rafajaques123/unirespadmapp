import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthProvider {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //efetuar login
  Stream<Map> get onAuthSatateChanged =>
      _firebaseAuth.authStateChanges().map((User currentUser) => {
            'id': currentUser.uid,
            'displayName': currentUser.displayName,
            'email': currentUser.email,
            'photoURL': currentUser.photoURL,
            'phoneNumber': currentUser.phoneNumber
          });

  Future<Map> efetuarLoginADM(String email, String senha) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);

      return {
        'id': userCredential.user.uid,
        'displayName': userCredential.user.displayName,
        'email': userCredential.user.email,
        'photoURL': userCredential.user.photoURL,
        'phoneNumber': userCredential.user.phoneNumber
      };
    } catch (ex) {
      print(ex.message);
      return null;
    }
  }

  //efetuar logoff
  Future<void> efetuarLogoff() async {
    try {
      return _firebaseAuth.signOut();
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
