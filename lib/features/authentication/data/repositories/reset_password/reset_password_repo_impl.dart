import 'package:book/core/usable_functions/firebase_auth.dart';

import 'reset_password_repo.dart';

class ResetPasswordImpl extends ResetPasswordRepo{
  @override
  Future<String> resetPassword({required String email}) async {
    String result='';
    try{
      await Authentication.resetPassword(email: email);
      result='User Created Successfully';
    }
    catch(e){
      result = e.toString();
    }

    return result;
  }
}