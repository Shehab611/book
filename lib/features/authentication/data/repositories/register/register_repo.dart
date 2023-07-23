import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
 Future<String> createNewUser({required (String email,String password) user});
 Future<String> verifyUserEmail({required User user});
}
