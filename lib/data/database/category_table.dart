import 'package:drift/drift.dart';

class CategoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
