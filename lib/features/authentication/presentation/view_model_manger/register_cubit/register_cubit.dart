import 'package:book/constants.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:book/features/authentication/presentation/components/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final RegisterRepo registerRepo=RegisterRepoImpl();

  @override
  Future<void> close() {
    confirmPasswordController.dispose();
    passwordController.dispose();
    emailController.dispose();
    return super.close();
  }

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void goToLogin(BuildContext context) {
    emit(GoToLoginScreen());
    AppNavigator.navigateToLoginScreen(context);

  }

  void signUpWithGoogle() async {
    ({String? errorString, bool succsuful}) data =
        await registerRepo.signUPWithGoogle();
    emit(SignUpWithGoogle(data: data));
  }

  void ifUserExits() async {
    FirebaseAuth.instance.currentUser!.reload();
    ({String? errorString, bool exits, bool succsuful}) data = await registerRepo
        .checkIfUserExits(FirebaseAuth.instance.currentUser!.email!);
    emit(IfUserExits(data: data));
  }

  void userRegister(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      ({String? errorString, bool succsuful}) data = await registerRepo
          .createNewUser(user: (emailController.text, passwordController.text));
      emit(UserRegister(data: data));
    }
  }

  void navigateToVerificationScreen(BuildContext context) {
    emit(GoToVerificationScreen());
    AppNavigator.navigateToVerificationScreen(context);

  }

  void verifyUserEmail() async {
    ({String? errorString, bool succsuful}) data = await registerRepo
        .verifyUserEmail(user: FirebaseAuth.instance.currentUser!);
    emit(VerifyUserEmail(data: data));
  }

  void navigateToCompleteProfile(BuildContext context) async {
    await FirebaseAuth.instance.currentUser!.reload().then((value) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        emit(GoToCompleteProfileScreen());
        AppNavigator.navigateToCompleteProfileScreen(context);

      } else {
 showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Your Email is not verified",
            style: GoogleFonts.montserrat(
                color: kDefaultColor, fontWeight: FontWeight.w800)
                .copyWith(
                fontSize: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.fontSize),
          ),
          content: Text("'Did not receive the confirmation mail?",
              style: GoogleFonts.montserrat(
                  color: kDefaultColor, fontWeight: FontWeight.w600)
                  .copyWith(
                  fontSize: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.fontSize)),
          backgroundColor: kColor,
          shape:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          actions: [
            ButtonWidget(
              onPressed: () {
                verifyUserEmail();
                Navigator.pop(context);
              },
              iconData: FontAwesomeIcons.paperPlane,
              buttonText: 'RESEND EMAIL',
              iconDirection: TextDirection.rtl,
            ),
            ButtonWidget(
              onPressed: () {
               AppNavigator.navigateToLoginScreen(context);
              },
              iconData:Icons.logout,
              buttonText: 'LogOut',
              iconDirection: TextDirection.rtl,
            ),
          ],
        );
      },
    );
      }
    });
  }

  void navigateToCompleteProfileFromGoogle(BuildContext context) {
    emit(GoToCompleteProfileScreenWithGoogle());
    AppNavigator.navigateToCompleteProfileScreen(context);

  }

  void navigateToHome(BuildContext context) {
    emit(GoToHomeScreen());
    AppNavigator.navigateToHomeScreen(context);

  }
}
