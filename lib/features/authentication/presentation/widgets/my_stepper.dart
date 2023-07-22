import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController secondNameController = TextEditingController();
  static TextEditingController birthdateController = TextEditingController();
  static String selectedGender = 'male';
  static int currentStep = 0;
  static List<Step> steps = [
    Step(
        state:
            MyStepper.currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: MyStepper.currentStep >= 0,
        title: const Text('Account info'),
        content: Column(
          children: [
            MyTextField(
                labelText: 'First Name',
                iconData: Icons.person,
                controller: firstNameController),
            const SizedBox(
              height: 7,
            ),
            MyTextField(
                labelText: 'Last Name',
                iconData: Icons.person,
                controller: secondNameController),
          ],
        )),
    Step(
        state:
            MyStepper.currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: MyStepper.currentStep >= 1,
        title: const Text('Personal info'),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_BirthDate(), _GenderSelection()],
        )),
  ];

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  @override
  void dispose() {
    MyStepper.firstNameController.dispose();
    MyStepper.secondNameController.dispose();
    MyStepper.birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            colorScheme: const ColorScheme.light(
          primary: kDefaultColor,
        )),
        child: Stepper(
          currentStep: MyStepper.currentStep,
          onStepCancel: () => MyStepper.currentStep == 0
              ? null
              : setState(() => MyStepper.currentStep -= 1),
          onStepContinue: () {
            bool isLastStep =
                (MyStepper.currentStep == MyStepper.steps.length - 1);
            if (isLastStep) {
              //Do something with this information
            } else {
              setState(() => MyStepper.currentStep += 1);
            }
          },
          onStepTapped: (step) => setState(() => MyStepper.currentStep = step),
          steps: MyStepper.steps,
          controlsBuilder: (context, details) {
            final bool isLastStep =
                MyStepper.currentStep == MyStepper.steps.length - 1;
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kDefaultColor),
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
                    child: Text(isLastStep ? 'Confirm' : 'Continue',
                        style: const TextStyle(
                            color: kColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  )),
                ],
              ),
            );
          },
        ));
  }
}

class _BirthDate extends StatelessWidget {
  const _BirthDate();

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
                    // header background color
                    onPrimary: kDefaultColor,
                    // header text color
                    onSurface: kColor, // body text color
                  ),
                ),
                child: child!);
          },
        );
        if (pickedDate != null) {
          MyStepper.birthdateController.text =
              pickedDate.toString().split(' ')[0];
        }
      },
      child: MyTextField(
        labelText: 'Birth Date',
        iconData: Icons.date_range_outlined,
        controller: MyStepper.birthdateController,
        enabled: false,
      ),
    );
  }
}

class _GenderSelection extends StatefulWidget {
  const _GenderSelection();

  @override
  State<_GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<_GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Radio<String>(
              value: 'male',
              groupValue: MyStepper.selectedGender,
              fillColor: MaterialStateProperty.all<Color>(kColor),
              onChanged: (value) {
                setState(() {
                  MyStepper.selectedGender = value!;
                });
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
              groupValue: MyStepper.selectedGender,
              fillColor: MaterialStateProperty.all<Color>(kColor),
              onChanged: (value) {
                setState(() {
                  MyStepper.selectedGender = value!;
                });
              },
            ),
            title: Text(
              'Female',
              style: GoogleFonts.montserrat(color: kDefaultColor),
            ),
          ),
        ),
      ],
    );
  }
}
