import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flight_booking/src/core/utils/copy_with_wrapper.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  final formKey = GlobalKey<FormState>();
  final departureController = TextEditingController();
  final destinationController = TextEditingController();

  void selectDate(DateTime date) {
    emit(state.copyWith(date: date.copyWithWrapper));
  }

  void removeSelectedDate() {
    emit(state.copyWith(date: null.copyWithWrapper));
  }

  @override
  Future<void> close() {
   departureController.dispose();
   destinationController.dispose();
    return super.close();
  }
}
