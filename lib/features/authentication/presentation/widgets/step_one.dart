import 'package:book/features/authentication/presentation/components/text_field.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        return Form(
          key: CompleteProfileCubit.get(context).formKeys[0],
          child: Column(
            children: [
              MyTextField(
                  labelText: 'First Name',
                  iconData: Icons.person,
                  validator: (p0) =>
                      (p0!.length < 3) ? 'This Field can not be empty' : null,
                  controller:
                      CompleteProfileCubit.get(context).firstNameController),
              const SizedBox(
                height: 7,
              ),
              MyTextField(
                labelText: 'Last Name',
                iconData: Icons.person,
                validator: (p0) =>
                    (p0!.length < 3) ? 'This Field can not be empty' : null,
                controller:
                    CompleteProfileCubit.get(context).secondNameController,
                isLast: true,
                onFieldSubmitted: (p0) =>
                    CompleteProfileCubit.get(context).onStepContinue,
              ),
            ],
          ),
        );
      },
    );
  }
}
