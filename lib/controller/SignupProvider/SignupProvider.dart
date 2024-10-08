import 'package:Al_Zab_township_guide/Models/SignupModel/SignupModel.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  bool isSignup = false;
  late SignupModel model;
    Map<String, String>? register;

  SignupProvider() {
    model = SignupModel();
  }
  void startLoading() {
    isSignup = true;
    notifyListeners();
  }

  void stopLoading() {
    isSignup = false;
    notifyListeners();
  }

  Future<void> saveData(
    BuildContext context,
  ) async {
    if (register == null) return;
    await model.saveData(context, register!);
  }


  Future<void> sendCode(
    SignupModel m,
    BuildContext context,
  ) async {
    model = await SignupModel(
      name: m.name,
      email: m.email,
      password: m.password,
      phone: m.phone,
      context: context,
    );
    this.register = {
      'name': m.name!,
      'email': m.email!,
      'phone': m.phone!,
      'password': m.password!
    };
    await model.sendCodeEmail(context, m.email!);

    notifyListeners();
  }

}
