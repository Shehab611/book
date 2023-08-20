class BookDetailsModel {
  BookDetailsModel({
    required this.id,
    required this.volumeInfo,
  });

   final String id;

   final VolumeInfo volumeInfo;

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      id: json['id'],
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
    );
  }
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.authors,
    required this.description,
    required this.averageRating,
    required this.ratingsCount,
    required this.previewLink,
  });

   final String title;
   final List<dynamic> authors;
   final String description;
   final double? averageRating;
   final int? ratingsCount;
   final String previewLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
        title: json['title'],
        authors: json['authors'],
        description: json['description'],
        averageRating: json['averageRating']??0,
        ratingsCount: json['ratingsCount']??0,
        previewLink: json['previewLink']);
  }
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });

   final String smallThumbnail;
   final String thumbnail;
   final String small;
   final String medium;
   final String large;

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
        smallThumbnail: json['smallThumbnail'],
        thumbnail: json['thumbnail'],
        small: json['small'],
        medium: json['medium'],
        large: json['large']);
  }
}
