// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String id;
  final String description;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  
  Task({
    required this.title,
    required this.date,
    this.isDone,
    this.isFavorite,
    this.isDeleted,
    required this.id,
    required this.description,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? id,
    String? description,
    String? date,
    String? title,
    bool? isDone,
    bool? isFavorite,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      date: title ?? this.date,
      description: description ?? this.description,
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
      'date': date,
       'id': id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ??'',
      date: map['date'] ??'',
      description: map['description'] ??'',
      isDone: map['isDone'],
      isFavorite: map['isFavorite'] ,
      isDeleted: map['isDeleted'] ,
      id: map['id'] ??'',
    );
  }

  @override
  List<Object?> get props =>
      [title, isDeleted, isDone, id, description, isFavorite, date];
}
