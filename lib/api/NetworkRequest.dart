import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:thanks/api/ServerAddresses.dart';
import 'package:thanks/models/User.dart';
import 'package:thanks/models/city.dart';
import 'package:thanks/models/providerUser.dart';
import 'package:thanks/services/helperFunctions.dart';

class NetworkRequest{
  static final NetworkRequest _instance = NetworkRequest._internal();
String token ;

  factory NetworkRequest() => _instance;

  NetworkRequest._internal();


  Future<dynamic> login(String phone, String password,String tokenUser) async {
    print("tokenUser :"+tokenUser);
    Map _result;
    bool status = false;
    print("login params" + phone + " " + password);
    if(phone=="966594103577"){
      print("kkkk");
      phone="+966594103577";
    }
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.Login,
//c3r49PAjQXO2yPdu_Vzft-:APA91bGoA5opX6tjndKWE-XQ7EIJdLVvHoFhlMVPIw-1kv4rBs-OFNkMJxxUttUPkm7ToVjY-cxNLklQUIEjIe-8pOTFZrrzg6JIgS-U_QfbrlmvUI51WYMqzJ__r0FLq40MsRHgyYLi
        body: {'mobile':"$phone",'device_token':"$tokenUser",'device_type':'android', 'password':password},
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          status = _result['status'];
          print(status);
          if (status ==true) {
            HelperFunctions.saveUserEmailSharedPreference(_result['items']['api_token']);
            HelperFunctions.saveUserMobileSharedPreference(_result['items']['mobile']);
            HelperFunctions.saveUserAddressSharedPreference(_result['items']['address']);
            HelperFunctions.saveUserPassWordSharedPreference(password);
            HelperFunctions.saveUserAdminSharedPreference(false);
            User user = User();
            user.id = _result['items']['id'];
            user.name = _result['items']['full_name'];
            user.email = _result['items']['email'];
            user.password = _result['items']['password'];
            user.phone = _result['items']['mobile'];
            HelperFunctions.saveUserNameSharedPreference(_result['items']['full_name']);
            return user;
          }else {
           // print("NO NO");
            if(_result['message']=="الحساب الخاص بك غير مفعل .. يرجى الانتظار لحين تفعيل حسابك"){
              return _result['message'];
            }else{
              return Resturantlogin(phone,password,tokenUser);
            }


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
  Future<dynamic> Resturantlogin(String phone, String password,String tokenUser) async {
    Map _result;
    bool status = false;
    print("login params" + phone + " " + password);
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.ResturantLogin,
        body: {'mobile':phone,'device_token':"$tokenUser",'device_type':'android', 'password':password},
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          status = _result['status'];
          print(status);
          if (status ==true) {
            HelperFunctions.saveUserEmailSharedPreference(_result['items']['api_token']);
            HelperFunctions.saveUserMobileSharedPreference(_result['items']['mobile']);
            HelperFunctions.saveUserAddressSharedPreference(_result['items']['address']);
            HelperFunctions.saveUserPassWordSharedPreference(password);
            HelperFunctions.saveUserAdminSharedPreference(true);
            User user = User();
            user.id = _result['items']['id'];
            user.name = _result['items']['full_name'];
            user.email = _result['items']['email'];
            user.password = _result['items']['password'];
            user.phone = _result['items']['mobile'];
            HelperFunctions.saveUserNameSharedPreference(_result['items']['full_name']);
            return user;
          }else {
            print("NO ");
            print(_result);
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

  Future<dynamic> add(String meal,String av_meals_count,String additions) async {
    Map _result;
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
   // bool status = false;

    String r="1";
    try {
      print(1);
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.Addproduct,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {'p_p_meal':meal,'meal_ingredients':'1','av_meals_count':av_meals_count, 'additions':additions},
      );
      print(2);
      print('login add response: ' + response.body);
      _result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(_result['message']);
        Fluttertoast.showToast(
            msg: _result['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
            textColor: Colors.white,
            fontSize: 16.0
        );
        try {
          print(_result);
         // status = _result['status'];

         return _result['message'];
        } catch (error) {
          print(3);
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
      String phone, String civil_registry,familyCount,district,address) async {
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
          'civil_registry': civil_registry,
          'family_count':familyCount,
          'district':district,
         'address':"$address / $district",
         'city' : "1",
        },
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        HelperFunctions.saveUserNameSharedPreference(name);
        print(status);
        if (status) {
         // login(phone,password);
          print("yes");
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
  Future<String> editproduct(String meal,String av_meals_count,String additions,var id) async {
    // String _result;
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.editproduct+ "$id?",
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'p_p_meal': meal,
          'meal_ingredients': meal,
          'av_meals_count': av_meals_count,
          'additions': additions,
        },
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status) {
          print("yes");
          return _result['message'];
        }else{
          return _result['message'];
        }
      } else {
        print('ERROR: ' +  _result['status']);
        throw Exception("Incorrect Registration Data.");
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      //throw CustomException(error.toString()).toString();
      rethrow;
    }
    // return _result;
  }
  Future<String> resturantRegister(String name, String password,
      String phone, String address,district) async {
    // String _result;
    print("reg params:name" +
        "name" +
        name +
        "password" +
        password +
        "phone" +
        phone
    );
    try {//"رقم الجوال موجود مسبقاً"
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.Resturantregister,
        body: {
          'last_ip': "1.1.1.1",
          'DOB': '12-12-1900',
          'mobile': phone,
          'password': password,
          'full_name': name,
          'district':district,
          'city':address,
          'address': "$address / $district"
        },
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      print("${response.statusCode} 4444");
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (_result['message'] is String) {
          return _result['message'];

        }else{
        //  login(phone,password);
          print("yes");
          return "تم";
        }
      } else {
        return _result['message'];
       //  throw Exception("Incorrect Registration Data.");
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      //throw CustomException(error.toString()).toString();
      rethrow;
    }
    // return _result;
  }
  Future<String> edituser(String name, String password,
      String phone, String address) async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
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
        ServerAddresses.serverAddress + ServerAddresses.edituser,
        body: {
          'username': name,
          'full_name': name,
          'DOB': '12-12-1900',
          'email':'',
          'mobile': phone,
          'password': password,
          'address': address
        },
          headers: {

            'Authorization': 'Bearer $token',
          }
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status == true) {
        //  login(phone,password);
          print("yes");
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
  Future<String> rate(String rate) async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    // String _result;

    try {
      final response = await http.post(
          ServerAddresses.serverAddress + ServerAddresses.rate + rate,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status == true) {
          print("yes");
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
  Future<String> rateRestaurant( String rate,String notes) async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    // String _result;

    try {
      final response = await http.post(//+ "rate=${rate}&notes=$notes"
          ServerAddresses.serverAddress + ServerAddresses.rateRestaurant ,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body:{
            'rate':rate,
            'notes':notes

      }
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status == true) {
          print("yes");
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
  Future<String> rateUser(String rate,String notes) async {
    print("$rate  $notes");
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    // String _result;
print(000);
    try {
      final response = await http.post(//+ "rate=${rate}&notes=$notes"
          ServerAddresses.serverAddress + ServerAddresses.rateUser ,
          headers: {

            'Authorization': 'Bearer $token',
          },
          body:{
            'rate':"$rate",
            'notes':"$notes"

          }
      );
      Map _result;
      bool status;
      print(response.statusCode);
      print(jsonDecode(response.body).toString());

      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status == true) {
          print("yes");
          return _result['message'];
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
  Future<String> cancelorder( cancelorder) async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    // String _result;

    try {
      final response = await http.post(
          ServerAddresses.serverAddress + ServerAddresses.cancelorder + "$cancelorder",

          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      Map _result;
      bool status;
      print(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        status = _result['status'];
        print(status);
        if (status == true) {
          print("yes");
          return _result['message'];
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
        print(_result["items"]);
      return _result["items"];
      }
    }catch(e){
    }
  }
  Future<dynamic> config() async {
    dynamic _result;
    try {
      final response = await http.get(
        ServerAddresses.serverAddress + ServerAddresses.config ,
      );
      print('get profile response: ' + response.body);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        print(_result["items"]);
        return _result["items"];
      }
    }catch(e){
    }
  }
  Future<dynamic> getUserResproducts() async {
    dynamic _result;
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    try {
      final response = await http.get(
        ServerAddresses.serverAddress + ServerAddresses.resproducts ,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('get profile response: ' + token);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        return _result["items"];
      }
    }catch(e){
    }
  }
  Future<dynamic> addcartitem(productId) async {
    print(productId);
      await HelperFunctions.getUserEmailSharedPreference().then((value){
        token  = value ;
      });

    dynamic _result;
    print('get token response: ' + token);
    try {
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.addcartitem,
          headers: {
            'Authorization': 'Bearer $token',
          },
        body: {
          "product_id":"$productId"
        }
      );
      print('get addcartitem response: ' + response.body);
      if (response.statusCode == 200) {
        print(1);
        _result = jsonDecode(response.body);
        print(_result);

        if(_result["status"]){
        return _result["message"];}
        else{
          print(9);
          return _result['message'];
        }
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future<dynamic> deleteCart(productId) async {
    print(productId);
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });

    dynamic _result;
    print('get token response: ' +productId );
    try {
      final response = await http.post(
          ServerAddresses.serverAddress + ServerAddresses.deleteCart,
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            "cart_id":productId
          }
      );
      print('get addcartitem response: ' + response.body);
      if (response.statusCode == 200) {
        print(1);
        _result = jsonDecode(response.body);


        if(_result["status"]){
          return _result["message"];}
        else{
          print(9);
          return _result['message'];
        }
      }
    }catch(e){
      print(e.toString());
    }
  }



  Future<dynamic> getCart() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    dynamic _result;
    print('get token response: ' + token);
    try {
      final response = await http.get(
        ServerAddresses.serverAddress + ServerAddresses.getCart,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
      );
    //  print('get profile response: ' + response.body);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        print(_result["items"]);
        return _result["items"];
      }
    }catch(e){
    }
  }
  Future<dynamic> getcities() async {

    dynamic _result;
    try {
      final response = await http.get(
          ServerAddresses.serverAddress + ServerAddresses.cities,
      );
      //  print('get profile response: ' + response.body);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);print(_result);
        return _result["items"];
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future<dynamic> getOrder() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    dynamic _result;
    print('get token response: ' + token);
    try {
      final response = await http.get(
          ServerAddresses.serverAddress + ServerAddresses.getOrder,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
     // print('get profile response: ' + response.body);
      if (response.statusCode == 200) {

        _result = jsonDecode(response.body);
        if(_result["status"]){
          return _result["items"];
        }

      }
    }catch(e){
    }
  }
  Future<dynamic> DailyOrders() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    print("nnnvvvv");
    dynamic _result;
    print('get token response: ' + token);
    try {
      final response = await http.get(
          ServerAddresses.serverAddress + ServerAddresses.DailyOrders,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      // print('get profile response: ' + response.body);
      if (response.statusCode == 200) {

        _result = jsonDecode(response.body);
        if(_result["status"]){
          print(_result);
          return _result["items"];
        }

      }
    }catch(e){
    }
  }
  Future<dynamic> monthOrders() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });

    dynamic _result;
    print('get token response: ' + token);
    try {
      final response = await http.get(
          ServerAddresses.serverAddress + ServerAddresses.monthOrders,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      print('get profile response: ' + response.body);
      if (response.statusCode == 200) {

        _result = jsonDecode(response.body); print(_result);
        if(_result["status"]){

          return _result["items"];
        }

      }
    }catch(e){
    }
  }
  Future<dynamic> addOrder() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    dynamic _result;
    print('get token response: ' + token);
    try {
      final response = await http.post(
          ServerAddresses.serverAddress + ServerAddresses.addOrder,
          headers: {
            'Authorization': 'Bearer $token',
          }
      );
      print('get pppp response: ' + response.body);
      if (response.statusCode == 200) {
        _result = jsonDecode(response.body);
        print(_result);
        return "ok";

      }
    }catch(e){
      print(e.toString());
    }
  }
  Future<dynamic> restaurantOrder() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    dynamic _result;
    try {
      final response = await http.get(
          ServerAddresses.serverAddress + ServerAddresses.restaurantOrder,
          headers: {
            'Authorization': 'Bearer $token',
          }
      );
     // print(_result["items"]['message']);
      print('get profile response: ' + response.body);
      if (response.statusCode == 200) {
        print(2);
        _result = jsonDecode(response.body);
        return _result["items"];
      }
    }catch(e){
    }
  }
  Future<dynamic> Addproduct(String meal,String av_meals_count,String additions) async {
    print("mmmm");
    // await HelperFunctions.getUserEmailSharedPreference().then((value){
    //   token  = value ;
    // });
    dynamic _result;
   // print('get token response: ' + token);
    try {
      print("mmmm1");
      final response = await http.post(
          ServerAddresses.serverAddress + ServerAddresses.Addproduct,

        body: {
              'p_p_meal':225,
              'meal_ingredients':225,
              'av_meals_count':225,
              'additions':255,
        }
      );
      print("mmmm");
      _result = jsonDecode(response.body);
     // print('get prodect response: ' + _result);
      if (response.statusCode == 200) {
        print("mmmm");
       print("llll");
        if(_result ['status']==true){
          return _result["message"];
        }else{
          return _result["message"];
        }

      }
    }catch(e){
      print('ERROR: ' + e.toString());
      print("mmmm");
    }
  }
  Future<dynamic> changestatusorder1( int order_id) async {
    print(order_id);
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    dynamic _result;
    // print('get token response: ' + token);
    try {
      print("mmmm1");
      final response = await http.post(
          ServerAddresses.serverAddress + ServerAddresses.changestatusorder,
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'order_id':"376",
            'status':4,
          }
      );
      print("mmmm");
      _result = jsonDecode(response.body);
      // print('get prodect response: ' + _result);
      if (response.statusCode == 200) {
        print("mmmm");
        print("llll");
        if(_result ['status']==true){
          return _result["message"];
        }else{
          return _result["message"];
        }

      }
    }catch(e){
      print('ERROR: ' + e.toString());
      print("mmmm");
    }
  }
  Future<dynamic> changestatusorder( order_id,status) async {
    Map _result;
    await HelperFunctions.getUserEmailSharedPreference().then((value){
      token  = value ;
    });
    // bool status = false;

    String r="1";
    try {
      print(1);
      final response = await http.post(
        ServerAddresses.serverAddress + ServerAddresses.changestatusorder,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'order_id':"$order_id",
          'status':status},
      );
      print(2);
      print('login add response: ' + response.body);
      _result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        try {
          print(_result);
          // status = _result['status'];

          return _result['message'];
        } catch (error) {
          print(3);
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




}