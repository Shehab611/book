import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/features/authentication/data/repositories/register_repo.dart';

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

}