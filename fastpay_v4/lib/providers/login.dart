import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:convert';
import '../models.dart/token_response.dart';
import 'package:crypto/crypto.dart';

class Auth with ChangeNotifier {
  /*
  //Auth(this.phoneNumber,this.sifre);

  bool check(String phoneNumber, String sifre) {
    phoneNumber.replaceAll(" ", "");

    if (phoneNumber == "5445441414" || sifre == "112233") {
      return true;
    }
  }*/

  static String sessionId = " ";

  static String encryKey = " ";
  static var hash = " ";

  Future<void> auth() async {
    var payload = {
      "appVersion": "7.3.5",
      "appName": "fastPay",
      "clientKey": "",
      "device": {
        "hasNfc": false,
        "deviceCode": "",
        "make": "generalmobile",
        "model": "GM 6 d",
        "os": {"family": "Android", "version": "19"}
      },
      "localeVersion": "",
    };

    var jsonString = json.encode(payload);

    return http.post('*******************',
        body: jsonString,
        headers: {
          'Content-Type': 'application/json'
        }).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while taking token data");
      }
//get data from response
      Map<String, Object> key = jsonDecode(utf8.decode(response.bodyBytes));
      AuthTokenResponse res = AuthTokenResponse.fromJson(key);
      print(response.body);

//decryption of encryption key

      final k = encrypt.Key.fromUtf8("SKhoAAydSYimCSiK");
      final iv = encrypt.IV.fromLength(16);
      final encrypter =
          encrypt.Encrypter(encrypt.AES(k, mode: encrypt.AESMode.cbc));
      final decrypted = encrypter.decrypt64(res.encryptionKey, iv: iv);
      final str = base64Encode(utf8.encode(decrypted));
      encryKey = str;

      sessionId = res.token;
    });
  }

  Future<void> checkPhone(String phone) async {
    await auth();

//encryption of phone number
    final key = encrypt.Key.fromBase64(encryKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, padding: "PKCS7", mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(phone, iv: iv);
    String encryptedPhone = encrypted.base64;

//encryption of checksum
    var payload = {"phoneNumber": encryptedPhone};
    var jsonPhone = json.encode(payload);
    print(encryptedPhone);

    List<int> messageBytes = utf8.encode(jsonPhone);

    List<int> k = base64.decode(encryKey);
    Hmac hmac = new Hmac(sha256, k);
    var digest = hmac.convert(messageBytes);
    var hash = base64Encode(digest.bytes);

    print(hash);

    return http.post("**********************",
        body: jsonPhone,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'X-Token': sessionId,
          'X-CheckSum': hash,
          "Accept-Language": "EN",
          "X-Client-Id": "14168afe85f59d7d",
          "X-Connection-Type": "Mobile",
        }).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        print(statusCode);
        throw new Exception("Error while fetching data");
      }

      // final jsonData = json.decode(response.body);
      print(statusCode);

      /*   final response =
        await http.post("******************************",
            headers: {
              "Content-Type": "application/json",
              "X-Client-Id": "546C08A1-D482-4B07-867C-636B917FAFFF",
              "Accept-Language": "EN",
              "X-Connection-Type": "Wifi",
              'X-Token': sessionId,
              'X-CheckSum': hash,
            },
            body: json.encode({"phoneNumber": encryptedPhone}));
    if (response.statusCode == 200) {
      print(response.statusCode);
    } else {
      throw Exception(response.statusCode);
    }
    */
      //}
    });
  }
}

/*import 'package:flutter/foundation.dart';

import '../Screens/login_screen.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import '../models.dart/token_response.dart';

class Login with ChangeNotifier{
  AuthTokenResponse res;
  static String encryptionKey;
  static String sessionID;

  Future<String> token() async {
    var payload = {
      "appVersion": "7.3.5",
      "appName": "fastPay",
      "clientKey": "",
      "device": {
        "hasNfc": false,
        "deviceCode": "",
        "make": "generalmobile",
        "model": "GM 6 d",
        "os": {"family": "Android", "version": "27"}
      },
      "localeVersion": "",
    };

    var jsonString = json.encode(payload);

    http
        .post('****************',
            headers: {'Content-Type': 'application/json'}, body: jsonString)
        .then((http.Response response) {
      if (response.statusCode != 200) {
        throw Exception("Error while taking token");
      }
      Map<String, Object> key = jsonDecode(utf8.decode(response.bodyBytes));
      res = AuthTokenResponse.fromJson(key);
     
//decryption of the key

      final k = encrypt.Key.fromUtf8("SKhoAAydSYimCSiK");
      final iv = encrypt.IV.fromLength(16);
      final encrypter =
          encrypt.Encrypter(encrypt.AES(k, mode: encrypt.AESMode.cbc));
      final decrypted = encrypter.decrypt64(res.encryptionKey, iv: iv);
      final str = base64Encode(utf8.encode(decrypted));
      final encyKeyFinal = base64Encode(str.codeUnits);
      
      encryptionKey = encyKeyFinal;
      sessionID = res.token;
      return encyKeyFinal;
    });
  }

  Future<void> checkPhone() async {
    //encryption of phone number
    var encyKey=await token();
    
    final key = encrypt.Key.fromBase64(encyKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, padding: "PKCS7", mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt("5445441414", iv: iv);
    print(encrypted.base64);
  }
}
*/
