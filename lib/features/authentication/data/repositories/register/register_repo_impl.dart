import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImpl implements RegisterRepo{
  @override
  Future<String> createNewUser({required (String email, String password) user}) async {
    String result='';
    try{
      await Authentication.createUserWithEmailAndPassword(email: user.$1, password: user.$2);
      result='User Created Successfully';
    }
    catch(e){
      result = e.toString();
    }

     return result;
  }

  @override
  Future<String> verifyUserEmail({required User user}) async{
    String result='';
    try{
      await Authentication.sendEmailVerification(user: user);
      result='Email Sent Successfully';
    }
    catch(e){
      result = e.toString();
    }

    return result;
  }

}