import 'package:book/constants.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/reset_password/reset_password_repo.dart';
import 'package:book/features/authentication/presentation/components/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitial());
  final ResetPasswordRepo resetPasswordRepo;

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void sendResetPassword(BuildContext context) async{
    if (formKey.currentState!.validate()) {
      ({String? errorString, bool succsuful}) data=await resetPasswordRepo.resetPassword(email: emailController.text).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Password Reset",
                style: GoogleFonts.montserrat(
                    color: kDefaultColor, fontWeight: FontWeight.w800)
                    .copyWith(
                    fontSize:
                    Theme.of(context).textTheme.headlineSmall?.fontSize),
              ),
              content: Text(
                  "Your Reset Password mail has been sent to your email.\nPlease for the instructions provided in this mail.",
                  style: GoogleFonts.montserrat(
                      color: kDefaultColor, fontWeight: FontWeight.w600)
                      .copyWith(
                      fontSize:
                      Theme.of(context).textTheme.bodyMedium?.fontSize)),
              backgroundColor: kColor,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              actions: [
                Center(
                  child: ButtonWidget(
                    onPressed: () {
                      goToLoginScreen(context);

                    },
                    iconData: Icons.check_circle_rounded,
                    buttonText: 'Go to Login Page',
                    iconDirection: TextDirection.rtl,
                  ),
                ),
              ],
            );
          },
        );
        return value;
      });
     emit(SendResetPassword(data: data));
    }
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRouter.kLoginScreen);
    emit(NavigateToLogin());
  }
}
