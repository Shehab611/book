import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:book/features/authentication/data/repositories/complete_profile/complete_profile_repo.dart';
import 'package:book/features/authentication/presentation/widgets/step_one.dart';
import 'package:book/features/authentication/presentation/widgets/step_three.dart';
import 'package:book/features/authentication/presentation/widgets/step_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit(this.completeProfileRepo)
      : super(CompleteProfileInitial());
  final CompleteProfileRepo completeProfileRepo;
  final Box<UserDataModel> userBox=serviceLocator.get<Box<UserDataModel>>();
  static CompleteProfileCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    firstNameController.dispose();
    secondNameController.dispose();
    birthdateController.dispose();
    return super.close();
  }
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  Gender selectedGender = Gender.male;
  String imageLink =
      'https://firebasestorage.googleapis.com/v0/b/book-330e2.appspot.com/o/user_image.jpg?alt=media&token=8a8c2c4e-d4f5-4a01-84d5-44bc1698945f';
  int currentStep = 0;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  List<Step> steps = [
    const Step(
        state: StepState.indexed,
        isActive: true,
        title: Text('Account info'),
        content: StepOne()),
    const Step(
        state: StepState.indexed,
        isActive: true,
        title: Text('Personal info'),
        content: StepTwo()),
    const Step(
        state: StepState.indexed,
        isActive: true,
        title: Text('Favourite Categories'),
        content: StepThree()),
  ];
  List<String> categories = [
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
  List<String> allSelected = [];

  void putData(){
    if(FirebaseAuth.instance.currentUser?.displayName != null && FirebaseAuth.instance.currentUser?.photoURL!= null){
      firstNameController.text=FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0];
      secondNameController.text=FirebaseAuth.instance.currentUser!.displayName!.split(' ')[1];
      imageLink=FirebaseAuth.instance.currentUser!.photoURL!;

    }
    emit(PutDataFromGoogleUser());
  }

  bool isLastStep() {
    return currentStep == steps.length - 1;
  }

  void uploadImage() async {
    ({bool successful, String? errorString, String? path}) data =
        await completeProfileRepo.uploadUserImage(
            subFolderName: FirebaseAuth.instance.currentUser!.email!);
    emit(UploadUserImage(data: data));
  }

  void changeGenderValue(Gender value) {
    selectedGender = value;
    emit(ChangeGenderValue());
  }

  void addToSelectedCategories(int index) {
    allSelected.add(categories[index]);
    emit(AddToSelectedCategories());
  }

  void removeFromSelectedCategories(int index) {
    allSelected.removeWhere((element) => element == categories[index]);
    emit(RemoveFromSelectedCategories());
  }

  bool doesContain(int index) {
    return allSelected.contains(categories[index]);
  }

  void Function()? onStepCancel() {
    currentStep == 0 ? null : currentStep -= 1;
    emit(StepCancel());
    return null;
  }

  void Function()? onStepContinue() {
    if (isLastStep()) {
      final UserDataModel userData=UserDataModel(
          fName: firstNameController.text,
          lName: secondNameController.text,
          birthDate: birthdateController.text,
          gender: selectedGender.name,
          bookCategories:allSelected,
          imageLink: imageLink,);
      completeProfileRepo.addUserData(userDataModel:userData);
      completeProfileRepo.addUserDataToDB(userDataModel:userData);
         emit(LastStepConfirm());
    }
    else {
      if (formKeys[currentStep].currentState!.validate()) {
        currentStep += 1;
        emit(StepContinue());
      }
    }

    return null;
  }

  void onStepTapped(int step) {
    currentStep = step;
    emit(StepTapped());
  }

  void navigateToHomeScreen(BuildContext context){
    emit(GoToHomeScreen());
    AppNavigator.navigateToHomeScreen(context);

  }

  void logOut(BuildContext context){
    FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
    emit(LogOut());
    AppNavigator.navigateToLoginScreen(context);

  }
}

enum Gender{
  male,female
}