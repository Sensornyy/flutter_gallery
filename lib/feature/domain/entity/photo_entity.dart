import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable {
  final String id;
  final String author;
  final String preview;
  final String full;

  const PhotoEntity({
    required this.id,
    required this.author,
    required this.preview,
    required this.full,
  });

  @override
  List<Object> get props => [id, author, preview, full];
}
