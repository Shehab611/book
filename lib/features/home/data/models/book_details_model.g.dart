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
