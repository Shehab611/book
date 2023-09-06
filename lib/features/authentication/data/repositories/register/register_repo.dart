

import 'package:firebase_auth/firebase_auth.dart';

abstract interface class RegisterRepo {
 Future<({bool succsuful, String? errorString})> createNewUser({required (String email,String password) user});
 Future<({bool succsuful, String? errorString}) > signUPWithGoogle();
 Future< ({bool succsuful, String? errorString}) > verifyUserEmail({required User user});
 Future<({String? errorString, bool exits,bool succsuful})> checkIfUserExits(String userEmail);
}
