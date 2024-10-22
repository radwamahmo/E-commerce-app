import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/api/Api_constants.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce_app/domain/entities/failurs.dart';
import 'package:http/http.dart' as http;
class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance! ;
  }
/*
https://ecommerce.routemisr.com/api/v1/auth/signup
 */

  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword,
      String phone) async {
    var connectivityResult = await Connectivity()
        .checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoint.registerApi);
      var registerRequest = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response = await http.post(url, body: registerRequest.toJson());
      // var responseBody = response.body;
      //      var json = jsonDecode(responseBody);
      var registerResponse = RegisterResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300){
        return Right(registerResponse);
      }else{
        return Left(ServerError(errorMessage: registerResponse.errors!=null?
        registerResponse.errors!.msg!:
        registerResponse.message
        ));
      }

    }else{
      return Left(NetWorkError(errorMessage: 'Please check internet connection'));


    }
  }

}