import 'package:book/core/usable_functions/firebase_auth.dart';

import 'reset_password_repo.dart';

class ResetPasswordImpl extends ResetPasswordRepo{
  @override
  ({bool succsuful, String? errorString}) resetPassword({required String email})  {

    try{
       Authentication.resetPassword(email: email);
      return (succsuful: true,errorString: null);
    }
    catch(e){
      return(succsuful:false,errorString:e.toString());
    }


  }
}