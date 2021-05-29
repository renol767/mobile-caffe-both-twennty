import 'package:equatable/equatable.dart';

class News extends Equatable {
  final dynamic id;
  final String title;
  final String description;
  final String picture;

  News({this.id, this.title, this.description, this.picture});

  factory News.fromJson(Map<String, dynamic> jsonData) => News(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      picture: jsonData['picture']);

  @override
  List<Object> get props => [id, title, description, picture];
}
