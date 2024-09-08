import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:uchuvalabs/configs.dart' as cg;


InputDecoration textFormFieldDecorationBox(
    IconData? icon,
    String hintText,
    String labelText,
    bool enabled,
    {Widget? suffixWidget}
    ) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      color: enabled ? Colors.orange[700] : Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey[400],
    ),
    filled: true,
    fillColor: enabled ? Colors.orange[50] : Colors.grey[200],
    enabled: enabled,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.orangeAccent,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.deepOrange,
        width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey[300]!,
        width: 2,
      ),
    ),
    suffixIcon: suffixWidget ?? (icon != null ? Icon(icon, color: Colors.orangeAccent) : null),
  );
}

class TextFormFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final double mediaWidth;
  final bool enabled;
  final String? labelText;
  final bool isRequired;
  final Function? validator;
  const TextFormFieldGeneral({super.key,
    required this.mediaWidth,
    required this.controller,
    required this.enabled,
    required this.icon,
    this.labelText,
    this.validator,
    this.isRequired = true
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cg.backColorGeneral,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      margin: EdgeInsets.symmetric(horizontal:mediaWidth),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        validator: validator!=null
            ?(value){
          return validator!(value);
        }
            :(value) {
          if (value!.trim().isEmpty) {
            if(isRequired){
              return 'No puede estar vacio';
            }else{
              return null;
            }
          }else if(value.trim().length<3){
            return 'Mínimo 4 caracteres';
          }
          return null;
        },
        keyboardType: TextInputType.name,
        style: TextStyle(fontSize: 12,color: cg.white),
        decoration:textFormFieldDecorationBox(
            icon,
            '',
            labelText ?? '',
            enabled
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class TextFormFieldDescriptions extends StatelessWidget {
  TextEditingController controller;
  double mediaWidth;
  bool enabled;
  String hintText;
  bool isRequired;
  TextFormFieldDescriptions({super.key,
    required this.mediaWidth,
    required this.controller,
    required this.enabled,
    required this.hintText,
    this.isRequired = true
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cg.backColorGeneral,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      margin: EdgeInsets.symmetric(horizontal:mediaWidth),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        minLines: 1,
        validator: !isRequired
            ?(value)=>null
            :(value) {
          if (value!.isEmpty) {
            return 'No puede estar vacio';
          } else if(value.length<3){
            return 'Al menos 4 caracteres';
          }
          return null;
        },
        maxLines: 8,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 12, color: cg.white),
        decoration:textFormFieldDecorationBox(
            null,
            '',
            '',
            enabled
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFieldGeneralsNumbers extends StatelessWidget {
  TextEditingController controller;
  double mediaWidth;
  bool enabled;
  String labelText;
  bool isRequired;
  Function? validator;
  TextFormFieldGeneralsNumbers({super.key,
    required this.mediaWidth,
    required this.controller,
    required this.enabled,
    required this.labelText,
    this.validator,
    this.isRequired = true
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: enabled? cg.backColorGeneral: cg.grey,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      margin: EdgeInsets.symmetric(horizontal:mediaWidth),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        validator: validator==null?null:(value){
          return validator!(value);
        },
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(fontSize: 12, color: cg.white),
        decoration:textFormFieldDecorationBox(
            null,
            '',
            '',
            enabled
        ),
      ),
    );
  }
}

class TextFormFieldWallet extends StatelessWidget {
  final TextEditingController controller;
  final double mediaWidth;
  final bool enabled;
  final bool showRequire;

  const TextFormFieldWallet({super.key,
    required this.mediaWidth,
    required this.controller,
    required this.enabled,
    this.showRequire = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cg.backColorGeneral,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      margin: EdgeInsets.symmetric(horizontal: mediaWidth),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        validator: (value) {
          if (value!.isEmpty) {
            return 'No puede estar vacio';
          } else if (value.length < 42) {
            return 'dirección no valida';
          } else if(value.length == 42){
            return null;
          }else{
            return 'dirección no valida';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(fontSize: 12, color: cg.black),
        decoration: textFormFieldDecorationBox(
            Icons.account_balance_wallet,
            '0x1234567890abcdef1234567890abcdef12345678',
            '',
            enabled
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFieldPassword extends StatefulWidget {
  TextEditingController controller;
  double mediaWidth;
  String labelText;
  final bool enabled;
  final Function validator;
  final bool showRequire;
  TextFormFieldPassword({super.key,
    required this.mediaWidth,
    required this.controller,
    required this.enabled,
    required this.validator,
    this.showRequire = false,
    required this.labelText
  });

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cg.backColorGeneral,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      margin: EdgeInsets.symmetric(horizontal:widget.mediaWidth),
      child: TextFormField(
        controller: widget.controller,
        enabled: widget.enabled,
        validator: (value) {
          return widget.validator(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        style: TextStyle(fontSize: 12,color: cg.black),
        decoration: textFormFieldDecorationBox(
            Icons.https,
            '',
            widget.showRequire?'${widget.labelText}*':widget.labelText,
            widget.enabled,
            suffixWidget: GestureDetector(
              onTap: (){
                obscureText=!obscureText;
                setState(() {});
              },
              child: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.orangeAccent,
              ),
            )
        ),
      ),
    );
  }
}
