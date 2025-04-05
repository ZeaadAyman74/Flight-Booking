import 'package:flight_booking/l10n/app_localizations.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/flight_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

import '../../../../core/mock_router.dart';

class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {}

void main() {
  late MockSearchCubit mockSearchCubit;
  late MockGoRouter mockGoRouter;
  late GlobalKey<FormState> formKey;
  late TextEditingController departureController;
  late TextEditingController destinationController;

  setUp(() {
    mockSearchCubit = MockSearchCubit();
    mockGoRouter = MockGoRouter();
    formKey = GlobalKey<FormState>();
    departureController = TextEditingController();
    destinationController = TextEditingController();
  });

  Widget createSearchScreen() {
    return ScreenUtilInit(
      designSize: const Size(375, 941),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MockGoRouterProvider(
            goRouter: mockGoRouter,
            child: BlocProvider<SearchCubit>(
              create: (context) => mockSearchCubit,
              child: FlightSearchScreen(),
            ),
          )),
    );
  }

  group('FlightSearchScreen', () {
    testWidgets('renders basic structure correctly', (tester) async {
      // arrange
      mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
      mocktail
          .when(() => mockSearchCubit.departureController)
          .thenReturn(departureController);
      mocktail
          .when(() => mockSearchCubit.destinationController)
          .thenReturn(destinationController);

      whenListen(
        mockSearchCubit,
        Stream.fromIterable([SearchState()]),
        initialState: SearchState(),
      );

      await tester.pumpWidget(
        createSearchScreen(),
      );

      // Verify AppBar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Where would you like to fly?'), findsOneWidget);
      expect(find.text('Search for the best flight deals'), findsOneWidget);
      expect(find.text('Find Flights'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(Key("dateFieldKey")), findsOneWidget);
      expect(find.byKey(Key("searchButton")), findsOneWidget);
    });

    //--------------------------------------------------------------------------
    testWidgets("enter text in departure field", (tester) async {
      // arrange
      mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
      mocktail
          .when(() => mockSearchCubit.departureController)
          .thenReturn(departureController);
      mocktail
          .when(() => mockSearchCubit.destinationController)
          .thenReturn(destinationController);

      whenListen(
        mockSearchCubit,
        Stream.fromIterable([SearchState()]),
        initialState: SearchState(),
      );

      await tester.pumpWidget(
        createSearchScreen(),
      );

      var departureField = find.byKey(Key("departureFieldKey"));
      await tester.enterText(departureField, 'NYC');

      expect(find.text('NYC'), findsOneWidget);
    });
    //--------------------------------------------------------------------------

    testWidgets("enter text in destination field", (tester) async {
      // arrange
      mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
      mocktail
          .when(() => mockSearchCubit.departureController)
          .thenReturn(departureController);
      mocktail
          .when(() => mockSearchCubit.destinationController)
          .thenReturn(destinationController);

      whenListen(
        mockSearchCubit,
        Stream.fromIterable([SearchState()]),
        initialState: SearchState(),
      );

      await tester.pumpWidget(
        createSearchScreen(),
      );

      var destinationField = find.byKey(Key("destinationFieldKey"));
      await tester.enterText(destinationField, 'LAX');

      expect(find.text('LAX'), findsOneWidget);
    });
    //--------------------------------------------------------------------------

    testWidgets("select travel date and show it in its field", (tester) async {
      // arrange
      mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
      mocktail
          .when(() => mockSearchCubit.departureController)
          .thenReturn(departureController);
      mocktail
          .when(() => mockSearchCubit.destinationController)
          .thenReturn(destinationController);
      final today = DateTime.now();

      whenListen(
        mockSearchCubit,
        Stream.fromIterable([
          SearchState(),
          SearchState(selectedDate: today),
        ]),
        initialState: SearchState(),
      );

      await tester.pumpWidget(
        createSearchScreen(),
      );

      // 3. Open date picker
      var dateField = find.byKey(Key("dateFieldKey"));
      await tester.tap(dateField);
      await tester.pumpAndSettle();

      // 4. Verify date picker is shown
      expect(find.byType(DatePickerDialog), findsOneWidget);

      // 6. Tap OK/Confirm button
      final confirmButton = find.text('OK');
      expect(confirmButton, findsOneWidget);
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();

      // 7. Verify the selected date is shown in the field
      expect(
          find.text(DateFormat('EEE, MMM d, y').format(today)), findsOneWidget);
    });
    //--------------------------------------------------------------------------

    testWidgets(
      "show date validation if no date selected",
      (tester) async {
        // arrange
        mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
        mocktail
            .when(() => mockSearchCubit.departureController)
            .thenReturn(departureController);
        mocktail
            .when(() => mockSearchCubit.destinationController)
            .thenReturn(destinationController);

        whenListen(
          mockSearchCubit,
          Stream.fromIterable([SearchState()]),
          initialState: SearchState(),
        );

        await tester.pumpWidget(
          createSearchScreen(),
        );

        var departureField = find.byKey(Key("departureFieldKey"));
        await tester.enterText(departureField, 'NYC');
        expect(find.text('NYC'), findsOneWidget);

        var destinationField = find.byKey(Key("destinationFieldKey"));
        await tester.enterText(destinationField, 'LAX');
        expect(find.text('LAX'), findsOneWidget);

        var searchButton = find.byKey(Key("searchButton"));
        await tester.tap(searchButton);
        await tester.pumpAndSettle();

        var errorDialog = find.byKey(Key("dateValidationKey"));
        expect(errorDialog, findsOneWidget);
      },
    );

    //--------------------------------------------------------------------------

    testWidgets(
      "show validation on departure field",
      (tester) async {
        // arrange
        mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
        mocktail
            .when(() => mockSearchCubit.departureController)
            .thenReturn(departureController);
        mocktail
            .when(() => mockSearchCubit.destinationController)
            .thenReturn(destinationController);
        final today = DateTime.now();

        whenListen(
          mockSearchCubit,
          Stream.fromIterable(
              [SearchState(), SearchState(selectedDate: today)]),
          initialState: SearchState(),
        );

        await tester.pumpWidget(
          createSearchScreen(),
        );

        var destinationField = find.byKey(Key("destinationFieldKey"));
        await tester.enterText(destinationField, 'LAX');
        expect(find.text('LAX'), findsOneWidget);

        // 3. Open date picker
        var dateField = find.byKey(Key("dateFieldKey"));
        await tester.tap(dateField);
        await tester.pumpAndSettle();

        // Verify date picker is shown
        expect(find.byType(DatePickerDialog), findsOneWidget);

        // Tap OK/Confirm button
        final confirmButton = find.text('OK');
        expect(confirmButton, findsOneWidget);
        await tester.tap(confirmButton);
        await tester.pumpAndSettle();

        // Verify the selected date is shown in the field
        expect(find.text(DateFormat('EEE, MMM d, y').format(today)),
            findsOneWidget);

        var searchButton = find.byKey(Key("searchButton"));
        await tester.tap(searchButton);
        await tester.pumpAndSettle();

        var validationMessage = find.text("Please enter departure city");
        expect(validationMessage, findsOneWidget);
      },
    );

    //--------------------------------------------------------------------------
    testWidgets(
      "show validation on destination field",
      (tester) async {
        // arrange
        mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
        mocktail
            .when(() => mockSearchCubit.departureController)
            .thenReturn(departureController);
        mocktail
            .when(() => mockSearchCubit.destinationController)
            .thenReturn(destinationController);
        final today = DateTime.now();

        whenListen(
          mockSearchCubit,
          Stream.fromIterable(
              [SearchState(), SearchState(selectedDate: today)]),
          initialState: SearchState(),
        );

        await tester.pumpWidget(
          createSearchScreen(),
        );

        var departureField = find.byKey(Key("departureFieldKey"));
        await tester.enterText(departureField, 'NYC');
        expect(find.text('NYC'), findsOneWidget);

        // 3. Open date picker
        var dateField = find.byKey(Key("dateFieldKey"));
        await tester.tap(dateField);
        await tester.pumpAndSettle();

        // Verify date picker is shown
        expect(find.byType(DatePickerDialog), findsOneWidget);

        // Tap OK/Confirm button
        final confirmButton = find.text('OK');
        expect(confirmButton, findsOneWidget);
        await tester.tap(confirmButton);
        await tester.pumpAndSettle();

        // Verify the selected date is shown in the field
        expect(find.text(DateFormat('EEE, MMM d, y').format(today)),
            findsOneWidget);

        var searchButton = find.byKey(Key("searchButton"));
        await tester.tap(searchButton);
        await tester.pumpAndSettle();

        var validationMessage = find.text("Please enter destination city");
        expect(validationMessage, findsOneWidget);
      },
    );
    //--------------------------------------------------------------------------

    testWidgets(
      "navigate to flights result screen",
      (tester) async {
        // arrange
        mocktail.when(() => mockSearchCubit.formKey).thenReturn(formKey);
        mocktail
            .when(() => mockSearchCubit.departureController)
            .thenReturn(departureController);
        mocktail
            .when(() => mockSearchCubit.destinationController)
            .thenReturn(destinationController);
        final today = DateTime.now();

        whenListen(
          mockSearchCubit,
          Stream.fromIterable(
              [SearchState(), SearchState(selectedDate: today)]),
          initialState: SearchState(),
        );

        mocktail.when(
              () => mockGoRouter.pushNamed(
            mocktail.any(),
            queryParameters: mocktail.any(named: 'queryParameters'),
          ),
        ).thenAnswer((_) async => null);

        await tester.pumpWidget(
          createSearchScreen(),
        );

        var departureField = find.byKey(Key("departureFieldKey"));
        await tester.enterText(departureField, 'NYC');
        expect(find.text('NYC'), findsOneWidget);

        var destinationField = find.byKey(Key("destinationFieldKey"));
        await tester.enterText(destinationField, 'LAX');
        expect(find.text('LAX'), findsOneWidget);

        // Open date picker
        var dateField = find.byKey(Key("dateFieldKey"));
        await tester.tap(dateField);
        await tester.pumpAndSettle();

        // Verify date picker is shown
        expect(find.byType(DatePickerDialog), findsOneWidget);

        // Tap OK/Confirm button
        final confirmButton = find.text('OK');
        expect(confirmButton, findsOneWidget);
        await tester.tap(confirmButton);
        await tester.pumpAndSettle();

        // Verify the selected date is shown in the field
        String formattedDate = DateFormat('EEE, MMM d, y').format(today);
        expect(find.text(formattedDate), findsOneWidget);

        var searchButton = find.byKey(Key("searchButton"));
        await tester.tap(searchButton);
        await tester.pumpAndSettle();

        // 9. Verify navigation occurred with correct parameters
        mocktail
            .verify(() => mockGoRouter.pushNamed('/flights',
                queryParameters: SearchQueryModel(
                        destination:'LAX' ,
                        departure:'NYC' ,
                        date: today)
                    .toMap()))
            .called(1);
      },
    );
  });
}
