import 'package:book/core/usable_functions/firebase_auth.dart';
import 'package:book/core/usable_functions/firebase_data.dart';
import 'package:book/core/utils/failure.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class LoginRepoImpl implements LoginRepo {
  @override
  Future<({bool succsuful, String? errorString})> userLogin(
      {required (String email, String password) user}) async {
    try {
      await Authentication.signInWithEmailAndPassword(
          email: user.$1, password: user.$2);
      return (succsuful: true, errorString: null);
    } on FirebaseAuthException catch (e) {
      final failure = FirebaseAuthFailure.fromAuthException(e);
      return (succsuful: false, errorString: failure.errMessage);
    } catch (e) {
      return (
        succsuful: false,
        errorString: 'Ops There was an Error, Please try again'
      );
    }
  }

  @override
  Future<({String? errorString, bool succsuful})> signUPWithGoogle() async {
    try {
      await Authentication.signInWithGoogle();
      return (succsuful: true, errorString: null);
    } catch (e) {
      return (succsuful: false, errorString: e.toString());
    }
  }

  @override
  Future<({String? errorString, bool exits, bool succsuful})> checkIfUserExits(
      String userEmail) async {
    try {
      bool exits = await DataHandling.checkIfDocExist(
          collectionName: 'users', docName: userEmail);
      return (exits: exits, errorString: null, succsuful: true);
    } catch (e) {
      return (exits: false, errorString: e.toString(), succsuful: false);
    }
  }
}
