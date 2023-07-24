import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
 ({bool succsuful, String? errorString})  createNewUser({required (String email,String password) user});
 ({bool succsuful, String? errorString})  verifyUserEmail({required User user});
}
