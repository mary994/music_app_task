import 'package:hive/hive.dart';

@HiveType(typeId: 15)
abstract class Track {
  @HiveField(0)
  int? duration;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? url;
}
