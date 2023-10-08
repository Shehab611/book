import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract final class Authentication {
  static Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signInWithEmailAndPassword(
          {required String email, required String password}) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  static Future<void> sendEmailVerification({required User user}) =>
      user.sendEmailVerification();

  static Future<void> resetPassword({required String email}) =>
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  static Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future signOutOfGoogle() async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
  }
}
