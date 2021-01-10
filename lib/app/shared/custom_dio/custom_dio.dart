import 'package:dio/native_imp.dart';

import 'interceptors.dart';

class CustomDio{

  final DioForNative client;

  CustomDio(this.client){
    client.options.baseUrl = 'https://ella-web.vercel.app';
    client.interceptors.add(CustomIntercetors());
    client.options.connectTimeout = 5000;
  }

}