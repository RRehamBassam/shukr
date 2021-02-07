import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thanks/api/ServerAddresses.dart';
import 'package:thanks/models/User.dart';

class NetworkRequest{
  static final NetworkRequest _instance = NetworkRequest._internal();

  factory NetworkRequest() => _instance;

  NetworkRequest._internal();


  Future<dynamic> login(String phone, String password,) async {
    Map _result;
    bool status = false;
    print("login params" + phone + " " + password);
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.Login,
        body: {'mobile':phone,'device_token':"23423423",'device_type':'android', 'password':password},
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          status = _result['status'];
          print(status);
          if (status ==true) {
            User user = User();
            user.id = _result['items']['id'];
            user.name = _result['items']['full_name'];
            user.email = _result['items']['email'];
            user.password = _result['items']['password'];
            user.phone = _result['items']['mobile'];
            return user;
          }else {
            print("NO NO");
           return _result['message'];
          }
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<String> register(String name, String password,
      String phone, String civil_registry) async {
    // String _result;
    print("reg params:name" +
        "name" +
        name +
        "password" +
        password +
        "phone" +
        phone
        );
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.register,
        body: {
          'last_ip': "1.1.1.1",
          'DOB': '12-12-1900',
          'mobile': phone,
          'password': password,
          'full_name': name,
          'civil_registry': civil_registry
        },
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status == true) {
          return "تم";
        }else{
          return _result['message'];
        }
      } else {
        throw Exception("Incorrect Registration Data.");
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      //throw CustomException(error.toString()).toString();
      rethrow;
    }
    // return _result;
  }
  Future<dynamic> getUserMeals() async {
    dynamic _result;
    try {
      final response = await http.get(
        ServerAddresses.serverAddress + ServerAddresses.Meals ,
      );
      print('get profile response: ' + response.body);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
      return _result["items"];
      }
    }catch(e){
    }
  }
  Future<dynamic> addcartitem(String productId) async {
    dynamic _result;
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.addcartitem,
        body: {
          'product_id': productId
        },
      );
      print('get profile response: ' + response.body);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        return _result["items"];
      }
    }catch(e){
    }
  }
}