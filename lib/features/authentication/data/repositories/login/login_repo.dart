

abstract interface class LoginRepo{

 Future<({bool succsuful, String? errorString})> userLogin({required (String email,String password) user});
 Future<({String? errorString, bool succsuful})> signUPWithGoogle();
 Future<({String? errorString, bool exits,bool succsuful})> checkIfUserExits(String userEmail);

}