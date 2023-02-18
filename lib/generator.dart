import 'package:hive/hive.dart';

part 'generator.g.dart';

@HiveType(typeId: 1)
class Generator {
  Generator({required this.name,required this.age});
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;
}
