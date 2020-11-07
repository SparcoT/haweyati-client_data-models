import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'time-slot_model.g.dart';

@HiveType(typeId: 155)
class TimeSlot {
  @HiveField(0)
  final TimeOfDay to;
  @HiveField(1)
  final TimeOfDay from;

  TimeSlot({this.to, this.from});

  static TimeSlot fromJson(dynamic json) {
    if (json == null) return null;

    if (json is String) {
      final arr = json.split('-');

      json = {
        'from': arr[0].toString().trim(),
        'to': arr[1].toString().trim(),
      };
    }

    final _to = json['to'].toString().split(':');
    final _from = json['from'].toString().split(':');
    print('$_to - $_from');

    return TimeSlot(
      to: TimeOfDay(
        hour: int.parse(_to[0]),
        minute: int.parse(_to[1]),
      ),
      from: TimeOfDay(
        hour: int.parse(_from[0]),
        minute: int.parse(_from[1]),
      ),
    );
  }

  List<TimeSlot> intervals(DateTime date) {
    TimeOfDay _current;

    if (date.day != DateTime.now().day) {
      _current = TimeOfDay.fromDateTime(date);
    } else {
      _current = TimeOfDay.fromDateTime(DateTime.now());
    }

    final _intervals = <TimeSlot>[];
    for (var i = from; i < to; i = i.increment(3)) {
      var next = i.increment(3);

      if (next > to) next = to;
      if (_current < next) _intervals.add(TimeSlot(from: i, to: next));
    }

    print(_intervals);
    return _intervals;
  }

  @override
  String toString() {
    return '${from.__toString()} - ${to.__toString()}';
  }

  static String toJson(TimeSlot slot) => '${slot.from.hour}:${slot.from.minute}'
      ' - ${slot.to.hour}:${slot.to.minute}';

  @override
  bool operator ==(Object other) {
    if (other is TimeSlot) {
      return to == other.to && from == other.from;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}

extension Comparison on TimeOfDay {
  String __toString() {
    final buffer = StringBuffer();

    buffer.write(hour % 12);
    if (minute > 0) {
      buffer.write(':');

      if (minute < 10) {
        buffer.write('0');
      }

      buffer.write(minute);
    }

    if (period == DayPeriod.am) {
      buffer.write(' AM');
    } else {
      buffer.write(' PM');
    }

    return buffer.toString();
  }

  bool operator <(TimeOfDay other) {
    if (hour < other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute < other.minute;
    }

    return false;
  }

  TimeOfDay increment(int hours) {
    return TimeOfDay(hour: hour + hours, minute: 0);
  }

  bool operator >(TimeOfDay other) {
    if (hour > other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute > other.minute;
    }

    return false;
  }
}
