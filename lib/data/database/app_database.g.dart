// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TaskItemsTable extends TaskItems
    with TableInfo<$TaskItemsTable, TaskItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
      'is_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_done" IN (0, 1))'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<Status, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Status>($TaskItemsTable.$converterstatus);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _plannedTimeMeta =
      const VerificationMeta('plannedTime');
  @override
  late final GeneratedColumn<double> plannedTime = GeneratedColumn<double>(
      'planned_time', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        isDone,
        status,
        categoryId,
        deadline,
        plannedTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_items';
  @override
  VerificationContext validateIntegrity(Insertable<TaskItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    } else if (isInserting) {
      context.missing(_isDoneMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('planned_time')) {
      context.handle(
          _plannedTimeMeta,
          plannedTime.isAcceptableOrUnknown(
              data['planned_time']!, _plannedTimeMeta));
    } else if (isInserting) {
      context.missing(_plannedTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      status: $TaskItemsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline'])!,
      plannedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}planned_time'])!,
    );
  }

  @override
  $TaskItemsTable createAlias(String alias) {
    return $TaskItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<Status, String> $converterstatus =
      const StatusConverter();
}

class TaskItem extends DataClass implements Insertable<TaskItem> {
  final int id;
  final String name;
  final String description;
  final bool isDone;
  final Status status;
  final int categoryId;
  final DateTime deadline;
  final double plannedTime;
  const TaskItem(
      {required this.id,
      required this.name,
      required this.description,
      required this.isDone,
      required this.status,
      required this.categoryId,
      required this.deadline,
      required this.plannedTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['is_done'] = Variable<bool>(isDone);
    {
      map['status'] =
          Variable<String>($TaskItemsTable.$converterstatus.toSql(status));
    }
    map['category_id'] = Variable<int>(categoryId);
    map['deadline'] = Variable<DateTime>(deadline);
    map['planned_time'] = Variable<double>(plannedTime);
    return map;
  }

  TaskItemsCompanion toCompanion(bool nullToAbsent) {
    return TaskItemsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      isDone: Value(isDone),
      status: Value(status),
      categoryId: Value(categoryId),
      deadline: Value(deadline),
      plannedTime: Value(plannedTime),
    );
  }

  factory TaskItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      status: serializer.fromJson<Status>(json['status']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      plannedTime: serializer.fromJson<double>(json['plannedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isDone': serializer.toJson<bool>(isDone),
      'status': serializer.toJson<Status>(status),
      'categoryId': serializer.toJson<int>(categoryId),
      'deadline': serializer.toJson<DateTime>(deadline),
      'plannedTime': serializer.toJson<double>(plannedTime),
    };
  }

  TaskItem copyWith(
          {int? id,
          String? name,
          String? description,
          bool? isDone,
          Status? status,
          int? categoryId,
          DateTime? deadline,
          double? plannedTime}) =>
      TaskItem(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        status: status ?? this.status,
        categoryId: categoryId ?? this.categoryId,
        deadline: deadline ?? this.deadline,
        plannedTime: plannedTime ?? this.plannedTime,
      );
  @override
  String toString() {
    return (StringBuffer('TaskItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isDone: $isDone, ')
          ..write('status: $status, ')
          ..write('categoryId: $categoryId, ')
          ..write('deadline: $deadline, ')
          ..write('plannedTime: $plannedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, description, isDone, status, categoryId, deadline, plannedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isDone == this.isDone &&
          other.status == this.status &&
          other.categoryId == this.categoryId &&
          other.deadline == this.deadline &&
          other.plannedTime == this.plannedTime);
}

class TaskItemsCompanion extends UpdateCompanion<TaskItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isDone;
  final Value<Status> status;
  final Value<int> categoryId;
  final Value<DateTime> deadline;
  final Value<double> plannedTime;
  const TaskItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isDone = const Value.absent(),
    this.status = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.deadline = const Value.absent(),
    this.plannedTime = const Value.absent(),
  });
  TaskItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required bool isDone,
    required Status status,
    required int categoryId,
    required DateTime deadline,
    required double plannedTime,
  })  : name = Value(name),
        description = Value(description),
        isDone = Value(isDone),
        status = Value(status),
        categoryId = Value(categoryId),
        deadline = Value(deadline),
        plannedTime = Value(plannedTime);
  static Insertable<TaskItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isDone,
    Expression<String>? status,
    Expression<int>? categoryId,
    Expression<DateTime>? deadline,
    Expression<double>? plannedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isDone != null) 'is_done': isDone,
      if (status != null) 'status': status,
      if (categoryId != null) 'category_id': categoryId,
      if (deadline != null) 'deadline': deadline,
      if (plannedTime != null) 'planned_time': plannedTime,
    });
  }

  TaskItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<bool>? isDone,
      Value<Status>? status,
      Value<int>? categoryId,
      Value<DateTime>? deadline,
      Value<double>? plannedTime}) {
    return TaskItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      status: status ?? this.status,
      categoryId: categoryId ?? this.categoryId,
      deadline: deadline ?? this.deadline,
      plannedTime: plannedTime ?? this.plannedTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $TaskItemsTable.$converterstatus.toSql(status.value));
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (plannedTime.present) {
      map['planned_time'] = Variable<double>(plannedTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isDone: $isDone, ')
          ..write('status: $status, ')
          ..write('categoryId: $categoryId, ')
          ..write('deadline: $deadline, ')
          ..write('plannedTime: $plannedTime')
          ..write(')'))
        .toString();
  }
}

class $CategoryItemsTable extends CategoryItems
    with TableInfo<$CategoryItemsTable, CategoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_items';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoryItemsTable createAlias(String alias) {
    return $CategoryItemsTable(attachedDatabase, alias);
  }
}

class CategoryItem extends DataClass implements Insertable<CategoryItem> {
  final int id;
  final String name;
  const CategoryItem({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoryItemsCompanion toCompanion(bool nullToAbsent) {
    return CategoryItemsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory CategoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryItem copyWith({int? id, String? name}) => CategoryItem(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryItem(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryItem && other.id == this.id && other.name == this.name);
}

class CategoryItemsCompanion extends UpdateCompanion<CategoryItem> {
  final Value<int> id;
  final Value<String> name;
  const CategoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CategoryItem> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoryItemsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $AchievementItemsTable extends AchievementItems
    with TableInfo<$AchievementItemsTable, AchievementItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievement_items';
  @override
  VerificationContext validateIntegrity(Insertable<AchievementItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AchievementItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AchievementItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $AchievementItemsTable createAlias(String alias) {
    return $AchievementItemsTable(attachedDatabase, alias);
  }
}

class AchievementItem extends DataClass implements Insertable<AchievementItem> {
  final int id;
  final String name;
  final String description;
  const AchievementItem(
      {required this.id, required this.name, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  AchievementItemsCompanion toCompanion(bool nullToAbsent) {
    return AchievementItemsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory AchievementItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AchievementItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  AchievementItem copyWith({int? id, String? name, String? description}) =>
      AchievementItem(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('AchievementItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AchievementItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class AchievementItemsCompanion extends UpdateCompanion<AchievementItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const AchievementItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  AchievementItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
  })  : name = Value(name),
        description = Value(description);
  static Insertable<AchievementItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  AchievementItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? description}) {
    return AchievementItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $ProgressOfAchievementItemsTable extends ProgressOfAchievementItems
    with
        TableInfo<$ProgressOfAchievementItemsTable, ProgressOfAchievementItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressOfAchievementItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _progressAchievement1Meta =
      const VerificationMeta('progressAchievement1');
  @override
  late final GeneratedColumn<int> progressAchievement1 = GeneratedColumn<int>(
      'progress_achievement1', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _progressAchievement2Meta =
      const VerificationMeta('progressAchievement2');
  @override
  late final GeneratedColumn<int> progressAchievement2 = GeneratedColumn<int>(
      'progress_achievement2', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _progressAchievement3Meta =
      const VerificationMeta('progressAchievement3');
  @override
  late final GeneratedColumn<int> progressAchievement3 = GeneratedColumn<int>(
      'progress_achievement3', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        progressAchievement1,
        progressAchievement2,
        progressAchievement3
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progress_of_achievement_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProgressOfAchievementItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('progress_achievement1')) {
      context.handle(
          _progressAchievement1Meta,
          progressAchievement1.isAcceptableOrUnknown(
              data['progress_achievement1']!, _progressAchievement1Meta));
    } else if (isInserting) {
      context.missing(_progressAchievement1Meta);
    }
    if (data.containsKey('progress_achievement2')) {
      context.handle(
          _progressAchievement2Meta,
          progressAchievement2.isAcceptableOrUnknown(
              data['progress_achievement2']!, _progressAchievement2Meta));
    } else if (isInserting) {
      context.missing(_progressAchievement2Meta);
    }
    if (data.containsKey('progress_achievement3')) {
      context.handle(
          _progressAchievement3Meta,
          progressAchievement3.isAcceptableOrUnknown(
              data['progress_achievement3']!, _progressAchievement3Meta));
    } else if (isInserting) {
      context.missing(_progressAchievement3Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProgressOfAchievementItem map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressOfAchievementItem(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      progressAchievement1: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}progress_achievement1'])!,
      progressAchievement2: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}progress_achievement2'])!,
      progressAchievement3: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}progress_achievement3'])!,
    );
  }

  @override
  $ProgressOfAchievementItemsTable createAlias(String alias) {
    return $ProgressOfAchievementItemsTable(attachedDatabase, alias);
  }
}

class ProgressOfAchievementItem extends DataClass
    implements Insertable<ProgressOfAchievementItem> {
  final int userId;
  final int progressAchievement1;
  final int progressAchievement2;
  final int progressAchievement3;
  const ProgressOfAchievementItem(
      {required this.userId,
      required this.progressAchievement1,
      required this.progressAchievement2,
      required this.progressAchievement3});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['progress_achievement1'] = Variable<int>(progressAchievement1);
    map['progress_achievement2'] = Variable<int>(progressAchievement2);
    map['progress_achievement3'] = Variable<int>(progressAchievement3);
    return map;
  }

  ProgressOfAchievementItemsCompanion toCompanion(bool nullToAbsent) {
    return ProgressOfAchievementItemsCompanion(
      userId: Value(userId),
      progressAchievement1: Value(progressAchievement1),
      progressAchievement2: Value(progressAchievement2),
      progressAchievement3: Value(progressAchievement3),
    );
  }

  factory ProgressOfAchievementItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressOfAchievementItem(
      userId: serializer.fromJson<int>(json['userId']),
      progressAchievement1:
          serializer.fromJson<int>(json['progressAchievement1']),
      progressAchievement2:
          serializer.fromJson<int>(json['progressAchievement2']),
      progressAchievement3:
          serializer.fromJson<int>(json['progressAchievement3']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'progressAchievement1': serializer.toJson<int>(progressAchievement1),
      'progressAchievement2': serializer.toJson<int>(progressAchievement2),
      'progressAchievement3': serializer.toJson<int>(progressAchievement3),
    };
  }

  ProgressOfAchievementItem copyWith(
          {int? userId,
          int? progressAchievement1,
          int? progressAchievement2,
          int? progressAchievement3}) =>
      ProgressOfAchievementItem(
        userId: userId ?? this.userId,
        progressAchievement1: progressAchievement1 ?? this.progressAchievement1,
        progressAchievement2: progressAchievement2 ?? this.progressAchievement2,
        progressAchievement3: progressAchievement3 ?? this.progressAchievement3,
      );
  @override
  String toString() {
    return (StringBuffer('ProgressOfAchievementItem(')
          ..write('userId: $userId, ')
          ..write('progressAchievement1: $progressAchievement1, ')
          ..write('progressAchievement2: $progressAchievement2, ')
          ..write('progressAchievement3: $progressAchievement3')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId, progressAchievement1, progressAchievement2, progressAchievement3);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressOfAchievementItem &&
          other.userId == this.userId &&
          other.progressAchievement1 == this.progressAchievement1 &&
          other.progressAchievement2 == this.progressAchievement2 &&
          other.progressAchievement3 == this.progressAchievement3);
}

class ProgressOfAchievementItemsCompanion
    extends UpdateCompanion<ProgressOfAchievementItem> {
  final Value<int> userId;
  final Value<int> progressAchievement1;
  final Value<int> progressAchievement2;
  final Value<int> progressAchievement3;
  final Value<int> rowid;
  const ProgressOfAchievementItemsCompanion({
    this.userId = const Value.absent(),
    this.progressAchievement1 = const Value.absent(),
    this.progressAchievement2 = const Value.absent(),
    this.progressAchievement3 = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressOfAchievementItemsCompanion.insert({
    required int userId,
    required int progressAchievement1,
    required int progressAchievement2,
    required int progressAchievement3,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        progressAchievement1 = Value(progressAchievement1),
        progressAchievement2 = Value(progressAchievement2),
        progressAchievement3 = Value(progressAchievement3);
  static Insertable<ProgressOfAchievementItem> custom({
    Expression<int>? userId,
    Expression<int>? progressAchievement1,
    Expression<int>? progressAchievement2,
    Expression<int>? progressAchievement3,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (progressAchievement1 != null)
        'progress_achievement1': progressAchievement1,
      if (progressAchievement2 != null)
        'progress_achievement2': progressAchievement2,
      if (progressAchievement3 != null)
        'progress_achievement3': progressAchievement3,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressOfAchievementItemsCompanion copyWith(
      {Value<int>? userId,
      Value<int>? progressAchievement1,
      Value<int>? progressAchievement2,
      Value<int>? progressAchievement3,
      Value<int>? rowid}) {
    return ProgressOfAchievementItemsCompanion(
      userId: userId ?? this.userId,
      progressAchievement1: progressAchievement1 ?? this.progressAchievement1,
      progressAchievement2: progressAchievement2 ?? this.progressAchievement2,
      progressAchievement3: progressAchievement3 ?? this.progressAchievement3,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (progressAchievement1.present) {
      map['progress_achievement1'] = Variable<int>(progressAchievement1.value);
    }
    if (progressAchievement2.present) {
      map['progress_achievement2'] = Variable<int>(progressAchievement2.value);
    }
    if (progressAchievement3.present) {
      map['progress_achievement3'] = Variable<int>(progressAchievement3.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressOfAchievementItemsCompanion(')
          ..write('userId: $userId, ')
          ..write('progressAchievement1: $progressAchievement1, ')
          ..write('progressAchievement2: $progressAchievement2, ')
          ..write('progressAchievement3: $progressAchievement3, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CompletedAchievementItemsTable extends CompletedAchievementItems
    with TableInfo<$CompletedAchievementItemsTable, CompletedAchievementItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompletedAchievementItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _achievementIdMeta =
      const VerificationMeta('achievementId');
  @override
  late final GeneratedColumn<int> achievementId = GeneratedColumn<int>(
      'achievement_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, achievementId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'completed_achievement_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<CompletedAchievementItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('achievement_id')) {
      context.handle(
          _achievementIdMeta,
          achievementId.isAcceptableOrUnknown(
              data['achievement_id']!, _achievementIdMeta));
    } else if (isInserting) {
      context.missing(_achievementIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CompletedAchievementItem map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedAchievementItem(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      achievementId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}achievement_id'])!,
    );
  }

  @override
  $CompletedAchievementItemsTable createAlias(String alias) {
    return $CompletedAchievementItemsTable(attachedDatabase, alias);
  }
}

class CompletedAchievementItem extends DataClass
    implements Insertable<CompletedAchievementItem> {
  final int userId;
  final int achievementId;
  const CompletedAchievementItem(
      {required this.userId, required this.achievementId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['achievement_id'] = Variable<int>(achievementId);
    return map;
  }

  CompletedAchievementItemsCompanion toCompanion(bool nullToAbsent) {
    return CompletedAchievementItemsCompanion(
      userId: Value(userId),
      achievementId: Value(achievementId),
    );
  }

  factory CompletedAchievementItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompletedAchievementItem(
      userId: serializer.fromJson<int>(json['userId']),
      achievementId: serializer.fromJson<int>(json['achievementId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'achievementId': serializer.toJson<int>(achievementId),
    };
  }

  CompletedAchievementItem copyWith({int? userId, int? achievementId}) =>
      CompletedAchievementItem(
        userId: userId ?? this.userId,
        achievementId: achievementId ?? this.achievementId,
      );
  @override
  String toString() {
    return (StringBuffer('CompletedAchievementItem(')
          ..write('userId: $userId, ')
          ..write('achievementId: $achievementId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, achievementId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompletedAchievementItem &&
          other.userId == this.userId &&
          other.achievementId == this.achievementId);
}

class CompletedAchievementItemsCompanion
    extends UpdateCompanion<CompletedAchievementItem> {
  final Value<int> userId;
  final Value<int> achievementId;
  final Value<int> rowid;
  const CompletedAchievementItemsCompanion({
    this.userId = const Value.absent(),
    this.achievementId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedAchievementItemsCompanion.insert({
    required int userId,
    required int achievementId,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        achievementId = Value(achievementId);
  static Insertable<CompletedAchievementItem> custom({
    Expression<int>? userId,
    Expression<int>? achievementId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (achievementId != null) 'achievement_id': achievementId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedAchievementItemsCompanion copyWith(
      {Value<int>? userId, Value<int>? achievementId, Value<int>? rowid}) {
    return CompletedAchievementItemsCompanion(
      userId: userId ?? this.userId,
      achievementId: achievementId ?? this.achievementId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (achievementId.present) {
      map['achievement_id'] = Variable<int>(achievementId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedAchievementItemsCompanion(')
          ..write('userId: $userId, ')
          ..write('achievementId: $achievementId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TaskItemsTable taskItems = $TaskItemsTable(this);
  late final $CategoryItemsTable categoryItems = $CategoryItemsTable(this);
  late final $AchievementItemsTable achievementItems =
      $AchievementItemsTable(this);
  late final $ProgressOfAchievementItemsTable progressOfAchievementItems =
      $ProgressOfAchievementItemsTable(this);
  late final $CompletedAchievementItemsTable completedAchievementItems =
      $CompletedAchievementItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        taskItems,
        categoryItems,
        achievementItems,
        progressOfAchievementItems,
        completedAchievementItems
      ];
}
