class UserDataModel {
  final String fName, lName, birthDate, gender,imageLink;
  final List<String> bookCategories;

  UserDataModel({required this.fName,
    required this.lName,
    required this.birthDate,
    required this.gender,
    required this.bookCategories,
    required this.imageLink,
  });


  factory UserDataModel.fromJson(Map<String, dynamic> json){
    return UserDataModel(fName: json['fName'],
        lName: json['lName'],
        imageLink: json['imageLink'],
        birthDate: json['birthDate'],
        gender: json['gender'],
        bookCategories: json['bookCategories']);
  }

 static Map<String,dynamic> toJson({required UserDataModel userDataModel}){
    return {
      'fName':userDataModel.fName,
      'lName':userDataModel.lName,
      'birthDate':userDataModel.birthDate,
      'gender':userDataModel.gender,
      'bookCategories':userDataModel.bookCategories,
      'imageLink':userDataModel.imageLink,
    };


  }

}
