

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';


late final String verificationIdReceiver;

Future<String> sendOtpOnWeb({
  required String countryCode,
  required String phoneNumber,
}) async =>
    FirebaseAuth.instance
        .signInWithPhoneNumber(
          '+$countryCode$phoneNumber',
        )
        .then((value) async =>verificationIdReceiver= value.verificationId)
        .catchError((error) => error.toString());

Future sendOtpOnAndroid({
  required String phoneNumber,
}) async {

  String text = '';
  try{

    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        text = e.message.toString();
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIdReceiver = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }catch (error){
    text = error.toString();
  }

  if (text.isNotEmpty) return text;
  return Future(() => null);
}

//verify
Future<String> verifyOtpToLogin({
  required String smsCode,
}) async {
  late String text = '';

  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdReceiver, smsCode: smsCode);

 try{
    await FirebaseAuth.instance.signInWithCredential(credential);
  }catch(error){
   text = error.toString();
 }
  if (FirebaseAuth.instance.currentUser != null) {
    text = "Sign in successfully";
  } else {
    text = "Sign in  failed";
  }
  return text;
}

Future<String> verifyOtpToLink(
    {required String smsCode, required User user}) async {
  String text = '';
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdReceiver, smsCode: smsCode);
  try{
    await user
        .linkWithCredential(credential)
        .whenComplete(() => text = 'Phone Linked Successful');
  }catch(error){
    text = error.toString();
  }
  return text;
}

Future<String> createUserWithEmailAndPassword(
        {required String email, required String password}) =>
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => 'User Created Successful')
        .catchError((error) => error.toString());

Future<String> signInWithEmailAndPassword(
        {required String email, required String password}) async =>
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => '')
        .catchError((error) => error.toString());

Future<String> sendEmailVerification({required User user}) => user
    .sendEmailVerification()
    .then((value) => 'Email Sent Successful')
    .catchError((error) => error.toString());

Future<String> resetPassword({required String email}) => FirebaseAuth.instance
    .sendPasswordResetEmail(email: email)
    .then((value) => 'Email Sent Successful')
    .catchError((error) => error.toString());

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
