// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookDetailsModelAdapter extends TypeAdapter<BookDetailsModel> {
  @override
  final int typeId = 1;

  @override
  BookDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookDetailsModel(
      id: fields[0] as String,
      volumeInfo: fields[1] as VolumeInfo,
    );
  }

  @override
  void write(BinaryWriter writer, BookDetailsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 2;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      title: fields[0] as String,
      authors: (fields[1] as List).cast<dynamic>(),
      description: fields[2] as String,
      averageRating: fields[3] as num?,
      ratingsCount: fields[4] as num?,
      previewLink: fields[5] as String,
      imageLinks: fields[6] as ImageLinks,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.averageRating)
      ..writeByte(4)
      ..write(obj.ratingsCount)
      ..writeByte(5)
      ..write(obj.previewLink)
      ..writeByte(6)
      ..write(obj.imageLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageLinksAdapter extends TypeAdapter<ImageLinks> {
  @override
  final int typeId = 3;

  @override
  ImageLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinks(
      smallThumbnail: fields[0] as String?,
      thumbnail: fields[1] as String?,
      small: fields[2] as String?,
      medium: fields[3] as String?,
      large: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinks obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.smallThumbnail)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.small)
      ..writeByte(3)
      ..write(obj.medium)
      ..writeByte(4)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
