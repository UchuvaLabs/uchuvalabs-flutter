import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uchuvalabs/configs.dart' as cg;
import 'package:uchuvalabs/views/dashboard.view.dart';
import 'package:uchuvalabs/views/login.view.dart';
import 'controllers/dashboard.controller.dart';
import 'controllers/login.controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => DashboardController())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: cg.navigatorKey,
      title: cg.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: cg.mainColor),
        useMaterial3: true,
        scaffoldBackgroundColor: cg.backColorGeneral,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginView(),
        'dashboard': (_) => const DashboardView()
      },
    );
  }
}