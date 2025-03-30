import 'package:equatable/equatable.dart';

class PaginateModel extends Equatable {
  const PaginateModel({
    required this.hasMore,
    required this.current,
    required this.total,
    required this.perPage,
    required this.lastPage,
  });

  final bool hasMore;
  final int current;
  final int total;
  final int perPage;
  final int lastPage;

  factory PaginateModel.fromJson(Map<String, dynamic> json) {
    return PaginateModel(
      hasMore: json['current_page']!= json['last_page'],
      current: json['current_page'] ?? 0,
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        hasMore,
        current,
        total,
        lastPage,
        perPage,];
}
