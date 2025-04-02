part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final DateTime? selectedDate;

  const SearchState({this.selectedDate});

  SearchState copyWith({
    CopyWithWrapper<DateTime?>? date,
  }) => SearchState(
        selectedDate: date==null ? selectedDate : date.value,
      );

  @override
  List<Object?> get props => [selectedDate];
}
