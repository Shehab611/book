import 'package:hive/hive.dart';

part 'user_data.g.dart';
@HiveType(typeId: 0)
final class UserDataModel extends HiveObject {

  @HiveField(0)
  final String fName;
  @HiveField(1)
  final String lName;
  @HiveField(2)
  final String birthDate;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String imageLink;
  @HiveField(5)
  final List<dynamic> bookCategories;

  UserDataModel({
    required this.fName,
    required this.lName,
    required this.birthDate,
    required this.gender,
    required this.bookCategories,
    required this.imageLink,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        fName: json['fName'],
        lName: json['lName'],
        imageLink: json['imageLink'],
        birthDate: json['birthDate'],
        gender: json['gender'],
        bookCategories: json['bookCategories']);
  }

  static Map<String, dynamic> toJson({required UserDataModel userDataModel}) {
    return {
      'fName': userDataModel.fName,
      'lName': userDataModel.lName,
      'birthDate': userDataModel.birthDate,
      'gender': userDataModel.gender,
      'bookCategories': userDataModel.bookCategories,
      'imageLink': userDataModel.imageLink,
    };
  }
}
