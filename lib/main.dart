import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/global/themes/light_theme.dart';
import '/intros/CreateAccount.dart';
import '/intros/LoginPage.dart';
import '/intros/Splash.dart';
import '/pages/main/HomeMain.dart';
import '/services/cart_service.dart';
import '/services/category_service.dart';
import '/services/coupon_service.dart';
import '/services/custome_service.dart';
import '/services/auth_service.dart';
import '/services/offer_service.dart';
import '/services/order_service.dart';
import '/services/page_nav_service.dart';
import '/services/products_service.dart';
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
                create: (_) => PageNavService(),
              ),
              ChangeNotifierProvider(
                create: (_) => ProductService(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartService(),
              ),
              ChangeNotifierProvider(
                create: (_) => CategoryService(),
              ),
              ChangeNotifierProvider(
                create: (_) => CouponService(),
              ),
              ChangeNotifierProvider(
                create: (_) => OrderService(),
              ),
              ChangeNotifierProvider(
                create: (_) => OfferService(),
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
