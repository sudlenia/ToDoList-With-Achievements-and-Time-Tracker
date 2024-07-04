import 'package:flutter_application_2/data/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    required String name,
  }) = _Category;

  factory Category.fromDatabase(CategoryItem item) => Category(
      id: item.id,
      name: item.name);
}
