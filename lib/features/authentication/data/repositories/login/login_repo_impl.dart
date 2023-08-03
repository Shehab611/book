import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';

final class LoginRepoImpl implements LoginRepo{
  @override
  Future<({bool succsuful, String? errorString}) > userLogin({required (String email,String password) user}) async{
    try{
       await Authentication.signInWithEmailAndPassword(email: user.$1, password: user.$2);
       return (succsuful: true,errorString: null);
    }
    catch(e){
      return (succsuful: false,errorString: e.toString());
    }
  }
  @override
Future < ({String? errorString, bool succsuful}) >signUPWithGoogle() async{
    try{
      await Authentication.signInWithGoogle();
      return (succsuful: true,errorString: null);
    }
    catch(e){
      return(succsuful:false,errorString:e.toString());
    }
  }
}