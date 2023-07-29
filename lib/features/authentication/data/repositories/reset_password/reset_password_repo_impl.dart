import 'package:book/core/usable_functions/firebase_auth.dart';

import 'reset_password_repo.dart';

class ResetPasswordImpl extends ResetPasswordRepo{
  @override
 Future< ({bool succsuful, String? errorString})> resetPassword({required String email})  async{

    try{
       await Authentication.resetPassword(email: email);
      return (succsuful: true,errorString: null);
    }
    catch(e){
      return(succsuful:false,errorString:e.toString());
    }


  }
}