import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/global/themes/light_theme.dart';
import 'package:ocean_park/intros/CreateAccount.dart';
import 'package:ocean_park/intros/LoginPage.dart';
import 'package:ocean_park/intros/Splash.dart';
import 'package:ocean_park/pages/main/HomeMain.dart';
import 'package:ocean_park/services/cart_service.dart';
import 'package:ocean_park/services/custome_service.dart';
import 'package:ocean_park/services/auth_service.dart';
import 'package:ocean_park/services/products_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((_) => {
        runApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => AuthService.instance(),
              ),
              ChangeNotifierProvider(
                create: (_) => CustomerService(),
              ),
              ChangeNotifierProvider(
                create: (_) => ProductService(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartService(),
              ),
            ],
            child: MyApp(),
          ),
        )
      });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ocean Park',
      theme: LightTheme().lightTheme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AuthService>(context).appState;
    return Scaffold(
      body: baseHome(appState),
    );
  }
}

Widget baseHome(AppState appState) {
  switch (appState) {
    case AppState.initizing:
      return Splash();
    case AppState.authorizing:
      return Splash();
    case AppState.unauthorized:
      return LoginPage();
    case AppState.authorized:
    
      return HomeMain();
    case AppState.noAccount:
      return CreateAccount();
    default:
      return Splash();
  }
}
