final class UserDataModel {
  final String userEmail;

  final String fName;

  final String lName;

  final String birthDate;

  final String gender;

  final String imageLink;

  final List<dynamic> bookCategories;

  UserDataModel({
    required this.userEmail,
    required this.fName,
    required this.lName,
    required this.birthDate,
    required this.gender,
    required this.bookCategories,
    required this.imageLink,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      userEmail: json['userEmail'],
      fName: json['fName'],
      lName: json['lName'],
      imageLink: json['imageLink'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      bookCategories: (json['bookCategories'] as String ).split('-'),
    );
  }

  static Map<String, dynamic> toJson({required UserDataModel userDataModel}) {
    return {
      'fName': userDataModel.fName,
      'lName': userDataModel.lName,
      'birthDate': userDataModel.birthDate,
      'gender': userDataModel.gender,
      'bookCategories': userDataModel.bookCategories.join('-'),
      'imageLink': userDataModel.imageLink,
      'userEmail':userDataModel.userEmail,
    };
  }
}
