import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uchuvalabs/configs.dart' as cg;

class CustomAlert {
  String title;
  String body;
  Function action;
  bool typeAlert;
  CustomAlert({
    required this.title,
    required this.body,
    required this.action,
    required this.typeAlert,
  });

  void show(BuildContext context){
    Alert(
      context: context,
      type: typeAlert? AlertType.success : AlertType.error,
      title: title,
      desc: body,
      buttons: [
        DialogButton(
          onPressed: (){
            action();
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "Continuar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

}
