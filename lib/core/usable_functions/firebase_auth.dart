import 'package:firebase_auth/firebase_auth.dart';

abstract class Authentication {

  static Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async{
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  static Future<void> sendEmailVerification({required User user}) => user
      .sendEmailVerification();

  static Future<void> resetPassword({required String email}) => FirebaseAuth.instance
      .sendPasswordResetEmail(email: email);


}



/*Future<String> signInWithGoogle() async {
  late String text = '';
  final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          text = "Sign in successfully";
        } else {
          text = "Sign in  failed";
        }
      },
    ).catchError((error) {
      text = error.toString();
    });
  }
  return text;
}

Future signOutOfGoogle() async {
  FirebaseAuth.instance.signOut();
   GoogleSignIn().disconnect();
  GoogleSignIn().signOut();
}

Future<String> linkGoogleAcc({required user}) async {
  late String text = '';
  final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await user
        .linkWithCredential(credential)
        .whenComplete(() => text = 'Google Account Linked Successful')
        .catchError((error) {
      text = error.message.toString();
    });

}
  return text;
}*/
