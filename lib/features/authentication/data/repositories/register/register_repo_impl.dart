import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterRepoImpl implements RegisterRepo{
  @override
  Future<({bool succsuful, String? errorString})> createNewUser({required (String email, String password) user}) async {
    try{
      await Authentication.createUserWithEmailAndPassword(email: user.$1, password: user.$2);
       return (succsuful: true,errorString: null);
    }
    catch(e){
      return(succsuful:false,errorString:e.toString());
    }

  }


  @override
  Future < ({String? errorString, bool succsuful})> signUPWithGoogle() async{
  try{
  await  Authentication.signInWithGoogle();
    return (succsuful: true,errorString: null);
  }
  catch(e){
    return(succsuful:false,errorString:e.toString());
  }
  }

  @override
  Future< ({bool succsuful, String? errorString}) > verifyUserEmail({required User user}) async{

    try{
      await  Authentication.sendEmailVerification(user: user);
      return (succsuful: true,errorString: null);
    }
    catch(e){
      return(succsuful:false,errorString:e.toString());
    }

  }

}