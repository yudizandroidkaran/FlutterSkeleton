import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isInternetAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.none) {
    return true;
  } else {
    return false;
  }
}
