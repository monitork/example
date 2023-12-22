import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/data_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_info.g.dart';

@Riverpod(keepAlive: true)
NetworkInfo networkInfo(NetworkInfoRef ref) {
  return NetworkInfo(
    DataConnectionChecker(),
    Connectivity(),
  );
}

class NetworkInfo {
  NetworkInfo(this.dataConnectionChecker, this.connectivity);

  final DataConnectionChecker dataConnectionChecker;
  final Connectivity connectivity;

  Future<bool> get hasInternetConnection => dataConnectionChecker.hasConnection;

  Future<ConnectivityResult> get hasNetworkConnectivity => connectivity.checkConnectivity();
}
