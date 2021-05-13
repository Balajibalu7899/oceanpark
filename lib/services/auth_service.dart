import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppState { initizing, authorized, unauthorized, authorizing, noAccount }

class AuthService extends ChangeNotifier {
  AppState _appState = AppState.initizing;
  AppState get appState => _appState;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  FirebaseAuth? _auth;

  User? user;
  bool? _newUser;

  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth?.authStateChanges().listen((firebaseUser) async {
      if (firebaseUser == null) {
        _appState = AppState.unauthorized;
      } else {
        user = _auth!.currentUser;
        _appState = AppState.authorizing;
        this.isNewUser();
      }
      notifyListeners();
    });
  }

  void isNewUser() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if (sharedPref.getBool('newUser') == null) {
      try {
        await FirebaseFirestore.instance.collection('customers').doc(user?.uid);
        this.setNewUser(true);
      } catch (error) {
        this.setNewUser(false);
      }
    } else {
      _newUser = sharedPref.getBool('newUser');
      this.setNewUser(_newUser!);
    }
  }

  void setNewUser(bool isNewUser) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if (isNewUser == true) {
      _appState = AppState.noAccount;
      _newUser = isNewUser;
      sharedPref.setBool('newUser', isNewUser);
    } else {
      _appState = AppState.authorized;
      sharedPref.setBool('newUser', isNewUser);
    }
    notifyListeners();
  }

  void phoneAuth() {
    _appState = AppState.authorizing;
    notifyListeners();
    isNewUser();
  }

  Future<bool> signIn(String? email, String? password) async {
    try {
      await _auth!
          .createUserWithEmailAndPassword(email: email!, password: password!);
      _appState = AppState.authorizing;
      notifyListeners();
      isNewUser();
      return true;
    } catch (exception) {
      _appState = AppState.unauthorized;
      notifyListeners();
      isNewUser();
      return false;
    }
  }

  Future<bool> login(String? email, String? password) async {
    try {
      await _auth!
          .signInWithEmailAndPassword(email: email!, password: password!);
      _appState = AppState.authorized;
      notifyListeners();
      isNewUser();
      return true;
    } catch (exception) {
      _appState = AppState.unauthorized;
      notifyListeners();
      isNewUser();
      return false;
    }
  }

  Future<bool> googleSignin() async {
    try {
      final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth!.signInWithCredential(credential);
      _appState = AppState.authorizing;
      notifyListeners();
      isNewUser();
      return true;
    } catch (err) {
      _appState = AppState.unauthorized;
      notifyListeners();
      return false;
    }
  }

  void logOut() async {
    _auth!.signOut();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('newUser');
    _appState = AppState.unauthorized;
    notifyListeners();
    isNewUser();
  }
}
