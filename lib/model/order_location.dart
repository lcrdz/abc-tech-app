import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderLocation {
  double lat;
  double long;
  DateTime dateTime;

  OrderLocation({
    required this.lat,
    required this.long,
    required this.dateTime,
  });

  OrderLocation copyWith({
    double? lat,
    double? long,
    DateTime? dateTime,
  }) {
    return OrderLocation(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory OrderLocation.fromMap(Map<String, dynamic> map) {
    return OrderLocation(
      lat: map['lat'] as double,
      long: map['long'] as double,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLocation.fromJson(String source) =>
      OrderLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderLocation(lat: $lat, long: $long, dateTime: $dateTime)';

  @override
  bool operator ==(covariant OrderLocation other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.long == long && other.dateTime == dateTime;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode ^ dateTime.hashCode;
}
