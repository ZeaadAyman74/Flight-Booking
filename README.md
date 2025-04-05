# ✈️ Flight Booking App

A simple and elegant Flutter application for booking flights. This app allows users to search flights by departure and destination, select travel dates, and view available flights. It’s built with clean architecture and modern Flutter tools.

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/a02862bc-baec-4cce-ae01-d52da6cc6d5a" width="200"/>
  <img src="https://github.com/user-attachments/assets/68f14b5f-8fb8-4aab-b4f4-c9d0fce0508e" width="200"/>
  <img src="https://github.com/user-attachments/assets/bf55929b-ce20-4b70-aa89-f21e39cfe44e" width="200"/>
  <img src="https://github.com/user-attachments/assets/44ce27c5-661b-45d0-a1ca-c33ae6258a50" width="200"/>
  <img src="https://github.com/user-attachments/assets/47bf37a8-aa1d-4369-b942-f7e132718b57" width="200"/>
  <img src="https://github.com/user-attachments/assets/b6628a73-5cc6-4a58-b0d8-849d859be2bb" width="200"/>
  <img src="https://github.com/user-attachments/assets/88a2d56f-5923-43da-ba86-4b8f7f6e474e" width="200"/>
</p>
 

## 🚀 Features

- 🔍 Flight search by destination and departure
- 📅 Date picker for travel selection
- 🛫 Animated flight results list
- 📲 Responsive design with `flutter_screenutil`
- 🧪 Full widget and unit test coverage
- 🌍 Localization support (English & Arabic)
- ⚙️ Clean architecture (data/domain/presentation)


## 📁 Floder Structure

└── 
    └── lib/
        ├── core/
        │   ├── di
        │   ├── extensions
        │   ├── router
        │   ├── theme
        │   ├── utils
        │   └── widgets
        ├── features/
        │   └── feature/
        │       ├── data/
        │       │   ├── data_source
        │       │   ├── models
        │       │   └── repos
        │       ├── domain/
        │       │   ├── repos
        │       │   └── usecases
        │       └── presentation/
        │           ├── bloc
        │           ├── screens
        │           └── widgets
        ├── root/
        ├── l10n/
        └── main.dart           



## 🛠 Tech Stack

- Flutter
- Bloc (Cubit)
- Dio (HTTP client)
- GoRouter (Navigation)
- flutter_screenutil (Responsive layout)
- Mocktail (for testing)
- Intl (Date formatting and localization)


🧪 Testing Flights Screen Logic
In the Flights Cubit, there are four different methods implemented to simulate and test various flight data responses:

✅ Get Flights from API – fetches flight data using the API service.

🧪 Get Mock Flights – returns mock data to simulate a successful search.

⚠️ Simulate Error Response – triggers an error scenario to test error handling and UI.

📭 Simulate Empty Result – returns an empty list to test empty state UI.

These methods are useful during development and testing to quickly switch between real and simulated states without changing much logic or relying on the backend.

🔍 You can easily toggle between them in the FlightsScreen.

### ✅ Prerequisites

- Flutter SDK installed
- Emulator or physical device

### ▶️ Run App

```bash
git clone https://github.com/ZeaadAyman74/Flight-Booking.git
cd flight_booking
flutter pub get
flutter run
