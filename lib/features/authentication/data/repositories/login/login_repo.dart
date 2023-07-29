abstract class LoginRepo{

 Future<({bool succsuful, String? errorString})> userLogin({required (String email,String password) user});
 Future<({String? errorString, bool succsuful}) >signUPWithGoogle();
}