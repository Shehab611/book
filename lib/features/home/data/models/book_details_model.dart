
import 'package:hive/hive.dart';

part 'book_details_model.g.dart';
@HiveType(typeId: 1)
final class BookDetailsModel {
  BookDetailsModel({
    required this.id,
    required this.volumeInfo,
  });
  @HiveField(0)
   final String id;
  @HiveField(1)
   final VolumeInfo volumeInfo;

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      id: json['id'],
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
    );
  }


  static Map<String, dynamic> toJson({required BookDetailsModel bookDetailsModel}) {
    return {
      'id': bookDetailsModel.id,
      'volumeInfo': VolumeInfo.toJson(volumeInfo: bookDetailsModel.volumeInfo),

    };
  }


}
@HiveType(typeId: 2)
final class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.authors,
    required this.description,
    required this.averageRating,
    required this.ratingsCount,
    required this.previewLink,
    required this.imageLinks
  });
  @HiveField(0)
   final String title;
  @HiveField(1)
   final List<dynamic> authors;
  @HiveField(2)
   final String description;
  @HiveField(3)
   final num? averageRating;
  @HiveField(4)
   final num? ratingsCount;
  @HiveField(5)
   final String previewLink;
  @HiveField(6)
   final ImageLinks imageLinks;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
        title: json['title'],
        authors: json['authors'],
        imageLinks: ImageLinks.fromJson(json['imageLinks']),
        description: json['description']??'',
        averageRating: json['averageRating']??0,
        ratingsCount: json['ratingsCount']??0,
        previewLink: json['previewLink']);
  }

  static Map<String, dynamic> toJson({required VolumeInfo volumeInfo}) {
    return {
      'title': volumeInfo.title,
      'authors': volumeInfo.authors,
      'description': volumeInfo.description,
      'averageRating': volumeInfo.averageRating,
      'ratingsCount': volumeInfo.ratingsCount,
      'previewLink': volumeInfo.previewLink,
      'imageLinks': ImageLinks.toJson(imageLinks: volumeInfo.imageLinks),
    };
  }


}
@HiveType(typeId: 3)
final class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });
  @HiveField(0)
   final String? smallThumbnail;
  @HiveField(1)
   final String? thumbnail;
  @HiveField(2)
   final String? small;
  @HiveField(3)
   final String? medium;
  @HiveField(4)
   final String? large;

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
        smallThumbnail: json['smallThumbnail']??'',
        thumbnail: json['thumbnail']??'',
        small: json['small']??'',
        medium: json['medium']??'',
        large: json['large']??'');
  }



  static Map<String, dynamic> toJson({required ImageLinks imageLinks}) {
    return {
      'smallThumbnail': imageLinks.smallThumbnail,
      'thumbnail': imageLinks.thumbnail,
      'small': imageLinks.small,
      'medium': imageLinks.medium,
      'large': imageLinks.large,
    };
  }

}
