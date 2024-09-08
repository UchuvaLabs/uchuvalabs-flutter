
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uchuvalabs/widgets/alerts.widget.dart';
import 'package:uchuvalabs/configs.dart' as cg;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class LoginController extends ChangeNotifier {
  Size size = const Size(0, 0);
  TextEditingController walletController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginPageFormKey = GlobalKey<FormState>();


  bool _isLoading = false;
  bool otpSended = false;

  bool get isLoadingGet {
    return _isLoading;
  }

  set isLoadingSet(bool x) {
    _isLoading = x;
    notifyListeners();
  }


  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Debes ingresar el código';
    } else if (value.length != 6) {
      return 'Debe ser código de 6 digitos';
    } else {
      return null;
    }
  }


  void tapLogin(BuildContext context, bool code) async {
    if(loginPageFormKey.currentState!.validate()){
      isLoadingSet = true;
      notifyListeners();
      if (!otpSended){
        if (await sendOTP()) {
          CustomAlert newAlert = CustomAlert(
              title: '!Bien',
              body: 'Te enviamos un código al email.',
              action: () {},
              typeAlert: true);
          newAlert.show(context);
          otpSended = true;
        } else {
          CustomAlert newAlert = CustomAlert(
              title: '!Ups',
              body: 'No podemos validarlo en este momento.',
              action: () {},
              typeAlert: false);
          newAlert.show(context);
          otpSended = false;
        }
      }else {
        if (await loginBack()) {
          switch(cg.role){
            case 'agricultor':
              print('agricultor');
              Navigator.of(context).pushNamed('dashboard');
              break;
            case 'inversor':
              print('inversor');
              Navigator.of(context).pushNamed('dashboard');
              break;
            case 'agronomo':
              print('agronomo');
              Navigator.of(context).pushNamed('dashboard');
              break;
            default:
              CustomAlert newAlert = CustomAlert(
                  title: '!Ups',
                  body: 'No podemos validarlo en este momento. Rol',
                  action: () {},
                  typeAlert: false);
              newAlert.show(context);
          }
        } else {
          CustomAlert newAlert = CustomAlert(
              title: '!Ups',
              body: 'Verifica tus datos y vuelve a intentarlo',
              action: () {},
              typeAlert: false);
          newAlert.show(context);
        }
      }
    }
    isLoadingSet = false;
    notifyListeners();
  }

  Future<bool> sendOTP() async {

    try {
      var url = Uri.parse('${cg.baseApi}/secure/user/generate-otp');
      var response =
          await http.post(url, body: {'wallet': walletController.text.trim()});
      print(response.statusCode);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> loginBack() async {
    try {
      var url = Uri.parse('${cg.baseApi}/secure/user/login');
      var response =
      await http.post(url, body: {'wallet': walletController.text.trim(), 'otp':passwordController.text.trim()});
      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        cg.token = jsonResponse['token']['token'];
        cg.role = jsonResponse['token']['role'];
        return true;
      } else {
        return false;
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  void gotToCoreWallet() async {
    final Uri androidUri = Uri.parse('core://');

    if (await canLaunchUrl(androidUri)) {
      await launchUrl(androidUri);
    } else {
      final Uri playStoreUri = Uri.parse('https://play.google.com/store/apps/details?id=com.avaxwallet');
      if (await canLaunchUrl(playStoreUri)) {
        await launchUrl(playStoreUri);
      } else {
        print('No se pudo abrir la app ni la Play Store');
      }
    }
  }

}