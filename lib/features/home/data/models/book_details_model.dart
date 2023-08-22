
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
}

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

   final String title;
   final List<dynamic> authors;
   final String description;
   final num? averageRating;
   final num? ratingsCount;
   final String previewLink;
   final ImageLinks imageLinks;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
        title: json['title'],
        authors: json['authors'],
        imageLinks: ImageLinks.fromJson(json['imageLinks']),
        description: json['description'],
        averageRating: json['averageRating']??0,
        ratingsCount: json['ratingsCount']??0,
        previewLink: json['previewLink']);
  }
}

final class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });

   final String? smallThumbnail;
   final String? thumbnail;
   final String? small;
   final String? medium;
   final String? large;

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
        smallThumbnail: json['smallThumbnail']??'',
        thumbnail: json['thumbnail']??'',
        small: json['small']??'',
        medium: json['medium']??'',
        large: json['large']??'');
  }
}
