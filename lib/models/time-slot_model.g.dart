// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time-slot_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeSlotAdapter extends TypeAdapter<TimeSlot> {
  @override
  final int typeId = 155;

  @override
  TimeSlot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeSlot(
      to: fields[0] as TimeOfDay,
      from: fields[1] as TimeOfDay,
    );
  }

  @override
  void write(BinaryWriter writer, TimeSlot obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.to)
      ..writeByte(1)
      ..write(obj.from);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSlotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
