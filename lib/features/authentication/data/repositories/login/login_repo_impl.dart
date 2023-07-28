import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  @override
  ({bool succsuful, String? errorString})  userLogin({required (String email,String password) user}) {
    try{
       Authentication.signInWithEmailAndPassword(email: user.$1, password: user.$2);
       return (succsuful: true,errorString: null);
    }
    catch(e){
      return (succsuful: false,errorString: e.toString());
    }
  }
  @override
  ({String? errorString, bool succsuful}) signUPWithGoogle() {
    try{
      Authentication.signInWithGoogle();
      return (succsuful: true,errorString: null);
    }
    catch(e){
      return(succsuful:false,errorString:e.toString());
    }
  }
}