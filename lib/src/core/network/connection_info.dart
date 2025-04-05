import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => checkConnectivity();

  Future<List<ConnectivityResult>> get connectionStatus =>
      connectionChecker.checkConnectivity();

  Future<bool> checkConnectivity() async {
    List<ConnectivityResult> result = await connectionStatus;
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      return true;
    } else {
      return false;
    }
  }
}