import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/components/text_field.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

final class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        return  Column(
          children: [
            _BirthDate(CompleteProfileCubit.get(context).birthdateController,CompleteProfileCubit.get(context).formKeys[1]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Radio<String>(
                      value: 'male',
                      groupValue: CompleteProfileCubit.get(context).selectedGender,
                      fillColor: MaterialStateProperty.all<Color>(kColor),
                      onChanged: (value) {

                        CompleteProfileCubit.get(context).changeGenderValue(value!);

                      },
                    ),
                    title: Text(
                      'Male',
                      style: GoogleFonts.montserrat(color: kDefaultColor),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Radio<String>(
                      value: 'female',
                      groupValue: CompleteProfileCubit.get(context).selectedGender,
                      fillColor: MaterialStateProperty.all<Color>(kColor),
                      onChanged: (value) {
                        CompleteProfileCubit.get(context).changeGenderValue(value!);
                      },
                    ),
                    title: Text(
                      'Female',
                      style: GoogleFonts.montserrat(color: kDefaultColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

final class _BirthDate extends StatelessWidget {
  const _BirthDate(this.birthdateController, this.formKey);
final TextEditingController birthdateController;
final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1990),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: kColor,
                    onPrimary: kDefaultColor,
                    onSurface: kColor,
                  ),
                ),
                child: child!);
          },
        );
        if (pickedDate != null) {
          birthdateController.text =
          pickedDate.toString().split(' ')[0];
        }
      },
      child: Form(
        key: formKey,
        child: MyTextField(
          labelText: 'Birth Date',
          iconData: Icons.date_range_outlined,
          controller: birthdateController,
          validator: (p0) =>
          (p0!.length < 3) ? 'This Field can not be empty' : null,
          enabled: false,
        ),
      ),
    );
  }
}

