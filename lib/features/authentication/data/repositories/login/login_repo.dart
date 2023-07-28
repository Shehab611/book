abstract class LoginRepo{

 ({bool succsuful, String? errorString}) userLogin({required (String email,String password) user});
 ({String? errorString, bool succsuful}) signUPWithGoogle();
}