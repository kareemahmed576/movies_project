import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnector {
  static Future<bool> checkConnection()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)){
      return true;
    }
    else {
      return false;
    }
  }
}