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
  static List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  static List<String> categories = [
    'Cooking',
    'Adventure',
    'Horror',
    'Thriller',
    'Romance',
    'Biography',
    'History',
    'Travel',
    'Money',
  ];
  static List<String> allSelected = [];
  static List<Step> steps = [
    Step(
        state: StepState.indexed,
        isActive: true,
        title: const Text('Account info'),
        content: Form(
          key: formKeys[0],
          child: Column(
            children: [
              MyTextField(
                  labelText: 'First Name',
                  iconData: Icons.person,
                  validator: (p0) =>
                      (p0!.length < 3) ? 'This Field can not be empty' : null,
                  controller: firstNameController),
              const SizedBox(
                height: 7,
              ),
              MyTextField(
                  labelText: 'Last Name',
                  iconData: Icons.person,
                  validator: (p0) =>
                      (p0!.length < 3) ? 'This Field can not be empty' : null,
                  controller: secondNameController),
            ],
          ),
        )),
    const Step(
        state: StepState.indexed,
        isActive: true,
        title: Text('Personal info'),
        content: Column(
          children: [
            _BirthDate(),
            _GenderSelection(),
          ],
        )),
    const Step(
        state: StepState.indexed,
        isActive: true,
        title: Text('Favourite Categories'),
        content: _SelectCategories()),
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
        physics: const NeverScrollableScrollPhysics(),
        currentStep: MyStepper.currentStep,
        onStepCancel: () => MyStepper.currentStep == 0
            ? null
            : setState(() => MyStepper.currentStep -= 1),
        onStepContinue: () {
          bool isLastStep = MyStepper.currentStep == MyStepper.steps.length - 1;
          if (isLastStep) {
          } else {
            if (MyStepper.formKeys[MyStepper.currentStep].currentState!
                .validate()) {
              setState(() => MyStepper.currentStep += 1);
            }
          }
        },
        onStepTapped: (step) {
          setState(() {
            MyStepper.currentStep = step;
          });
        },
        steps: MyStepper.steps,
        controlsBuilder: (context, details) {
          final bool isLastStep =
              MyStepper.currentStep == MyStepper.steps.length - 1;
          return Container(
            margin: const EdgeInsets.only(top: 8),
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
      ),
    );
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
                    onPrimary: kDefaultColor,
                    onSurface: kColor,
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
      child: Form(
        key: MyStepper.formKeys[1],
        child: MyTextField(
          labelText: 'Birth Date',
          iconData: Icons.date_range_outlined,
          controller: MyStepper.birthdateController,
          validator: (p0) =>
              (p0!.length < 3) ? 'This Field can not be empty' : null,
          enabled: false,
        ),
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

class _SelectCategories extends StatefulWidget {
  const _SelectCategories();

  @override
  State<_SelectCategories> createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<_SelectCategories> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 3,
      alignment: WrapAlignment.center,
      spacing: 5,
      children: List.generate(
          MyStepper.categories.length,
          (index) => FilterChip(
                label: Text(
                  MyStepper.categories[index],
                  style: const TextStyle(color: kColor),
                ),
                showCheckmark: true,
                selected:
                    MyStepper.allSelected.contains(MyStepper.categories[index]),
                selectedColor: kDefaultColor.withOpacity(.4),
                onSelected: (bool value) {
                  setState(() {
                    if (value) {
                      MyStepper.allSelected.add(MyStepper.categories[index]);
                    } else {
                      MyStepper.allSelected.removeWhere(
                          (String name) => name == MyStepper.categories[index]);
                    }
                  });
                },
              )),
    );
  }
}
