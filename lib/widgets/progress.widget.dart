import 'package:flutter/material.dart';
import 'package:uchuvalabs/configs.dart' as cg;

class ProgressWD extends StatelessWidget {
  const ProgressWD({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child:  CircularProgressIndicator(
            backgroundColor: cg.secBackColorButton,
            valueColor: AlwaysStoppedAnimation<Color>(cg.mainColor),
          ),
        )
    );
  }
}


