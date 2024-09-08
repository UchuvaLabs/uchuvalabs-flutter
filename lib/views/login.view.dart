import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../controllers/login.controller.dart';
import '../widgets/buttons.widget.dart';
import '../widgets/progress.widget.dart';
import 'package:uchuvalabs/configs.dart' as cg;

import '../widgets/textfields.widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final loginController = context.watch<LoginController>();
    loginController.size = MediaQuery.of(context).size;
    return Scaffold(
      body: loginController.isLoadingGet
          ? const ProgressWD()
          : SafeArea(
            child: Center(
              child: Animate(
                effects: [FadeEffect(), ScaleEffect()],
                child: Form(
                  key: loginController.loginPageFormKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 80,
                            height: 80,
                          ).animate()
                          .fadeIn()
                          .scale()
                          .move(delay: 300.ms, duration: 600.ms)
                          .blurXY(begin: 10.0, end: 0.0, duration: 600.ms),
                          const Divider(color: Colors.transparent,),
                          Container(
                            width: loginController.size.width,
                            padding: EdgeInsets.symmetric
                              (horizontal: loginController.size.width*0.10),
                            child: Text(
                              'UchuvaLabs',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: cg.mainColor
                              ),
                            ),
                          ),
                          const Divider(color: Colors.transparent,),
                          Container(
                            width: loginController.size.width,
                            padding: EdgeInsets.symmetric
                              (horizontal: loginController.size.width*0.10),
                            child: Text(
                              'Dirección Wallet',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: cg.secTextColorButton
                                      .withOpacity(0.7)
                              ),
                            ),
                          ),

                          const Divider(color: Colors.transparent,),
                          TextFormFieldWallet(
                            enabled: true,
                            mediaWidth: loginController.size.width * 0.10,
                            controller: loginController.walletController,
                          ),
                          IconButton(onPressed:
                          loginController.gotToCoreWallet,
                            icon: Image.asset('assets/core-logo.png', height: 40, width: 40,),
                          ),
                          if(loginController.otpSended)Column(
                            children: [
                              Container(
                                width: loginController.size.width,
                                padding: EdgeInsets.symmetric
                                  (horizontal: loginController.size.width*0.10),
                                child: Text(
                                  'Ingrese código enviado al email',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: cg.secTextColorButton
                                          .withOpacity(0.7)
                                  ),
                                ),
                              ),
                              const Divider(color: Colors.transparent,),
                              TextFormFieldPassword(
                                enabled: true,
                                labelText: '',
                                validator: loginController.passwordValidator,
                                mediaWidth: loginController.size.width * 0.10,
                                controller: loginController.passwordController,
                              ),
                            ],
                          ),
                          CustomButtonGeneral(
                              mediaWidth: loginController.size.width,
                              txtBtn: 'Ingresar',
                              clickBtn: () {
                                loginController.tapLogin(context, loginController.otpSended);
                              },
                              buttonColor: cg.mainBackColorButton
                          ),
                          Container(
                            padding: EdgeInsets.symmetric
                              (horizontal: loginController.size.width*0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          strokeAlign: BorderSide
                                              .strokeAlignCenter,
                                          color: cg.mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalDivider
                                  (color: Colors.transparent,),
                                const VerticalDivider
                                  (color: Colors.transparent,),
                                Expanded(
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          strokeAlign: BorderSide
                                              .strokeAlignCenter,
                                          color: cg.mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          const Divider(color: Colors.transparent,),
                          Text(cg.version,
                            style: TextStyle(
                                color: cg.secTextColorButton,
                                fontSize: 8
                            ),),
                          const Divider(color: Colors.transparent,),
                          Text('Potenciado con la Blockchain',
                            style: TextStyle(
                                color: cg.secTextColorButton,
                                fontSize: 8
                            ),),
                          Image.asset('assets/avalanche-logo.png', height: 70, width: 70,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}