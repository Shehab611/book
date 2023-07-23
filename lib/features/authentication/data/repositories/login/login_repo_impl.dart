import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  @override
  Future<String> userLogin({required (String email,String password) user}) async{
    String result='';
    try{
      await Authentication.signInWithEmailAndPassword(email: user.$1, password: user.$2);
      result='User Logged Successfully';
    }
    catch(e){
      result = e.toString();
    }

    return result;
  }
}