import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_info_provider.g.dart';

@Riverpod(keepAlive: true)
NetworkInfo networkInfo(Ref ref) {
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
