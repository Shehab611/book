import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyStepper extends StatelessWidget {
  const MyStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
      listener: (context,state){
        if(state is LastStepConfirm)
        {
          CompleteProfileCubit.get(context).navigateToHomeScreen(context);

        }
      },

      builder: (context, state) {
        return Theme(
          data: ThemeData(
              colorScheme: const ColorScheme.light(
            primary: kDefaultColor,
          )),
          child: Stepper(
            physics: const NeverScrollableScrollPhysics(),
            currentStep: CompleteProfileCubit.get(context).currentStep,
            onStepCancel: CompleteProfileCubit.get(context).onStepCancel,
            onStepContinue: CompleteProfileCubit.get(context).onStepContinue,
            onStepTapped: (step) {
              CompleteProfileCubit.get(context).onStepTapped(step);
            },
            steps: CompleteProfileCubit.get(context).steps,
            controlsBuilder: (context, details) {
              return Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kDefaultColor),
                      ),
                      onPressed: details.onStepCancel,
                      child: const Text('Back',
                          style: TextStyle(
                              color: kColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kDefaultColor)),
                      onPressed: details.onStepContinue,
                      child: Text(
                          CompleteProfileCubit.get(context).isLastStep()
                              ? 'Confirm'
                              : 'Continue',
                          style: const TextStyle(
                              color: kColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    )),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
