import 'package:hive_flutter/hive_flutter.dart';

part 'theme_hive.g.dart';

@HiveType(typeId: 0)
class ThemeDatabase {
  @HiveField(0)
  bool? themeSettings;
  ThemeDatabase({required this.themeSettings});
}
