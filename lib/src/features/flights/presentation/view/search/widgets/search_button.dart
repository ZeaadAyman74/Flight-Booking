import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/router/routes.dart';
import 'package:flight_booking/src/core/utils/utils.dart';
import 'package:flight_booking/src/core/widgets/custom_button.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = context.read<SearchCubit>();
    return CustomButton(
      title: context.localization.search_flights,
      onPressed: () {
        if (searchCubit.formKey.currentState!.validate()) {
          if (searchCubit.state.selectedDate == null) {
            context.showMessageDialog(
              key: const Key("dateValidationKey"),
                message: context.localization.please_select_travel_date);
            return;
          }
          context.pushNamed(Routes.flights,
              queryParameters: SearchQueryModel(
                      destination: searchCubit.destinationController.text,
                      departure: searchCubit.departureController.text,
                      date: searchCubit.state.selectedDate!)
                  .toMap());
        }
      },
    );
  }
}
