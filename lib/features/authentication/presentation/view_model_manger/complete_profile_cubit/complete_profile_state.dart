part of 'complete_profile_cubit.dart';

sealed class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}
class UploadUserImage extends CompleteProfileState{
  final ({bool succsuful, String? errorString,String? path}) data;
  UploadUserImage({required this.data});
}
class UploadUserData extends CompleteProfileState{
  final ({bool succsuful, String? errorString,}) data;
  UploadUserData({required this.data});
}
class ChangeGenderValue extends CompleteProfileState{}
class AddToSelectedCategories extends CompleteProfileState{}
class RemoveFromSelectedCategories extends CompleteProfileState{}
class DoesContain extends CompleteProfileState{}
class StepCancel extends CompleteProfileState{}
class StepContinue extends CompleteProfileState{}
class StepTapped extends CompleteProfileState{}