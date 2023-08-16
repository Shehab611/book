import 'package:book/constants.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo.dart';
import 'package:book/features/authentication/presentation/components/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

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
    Navigator.pushReplacementNamed(
      context,
      AppRouter.kLoginScreen,
    );

  }

  void signUpWithGoogle() async {
    ({String? errorString, bool succsuful}) data =
        await registerRepo.signUPWithGoogle();
    emit(SignUpWithGoogle(data: data));
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
    Navigator.pushNamed(context, AppRouter.kVerificationScreen);

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
        Navigator.pushReplacementNamed(context, AppRouter.kCompleteProfile);

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
                Center(
                  child: ButtonWidget(
                    onPressed: () {
                      verifyUserEmail();
                      Navigator.pop(context);
                    },
                    iconData: FontAwesomeIcons.paperPlane,
                    buttonText: 'RESEND EMAIL',
                    iconDirection: TextDirection.rtl,
                  ),
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
    Navigator.pushNamed(context, AppRouter.kCompleteProfile,);

  }
}
