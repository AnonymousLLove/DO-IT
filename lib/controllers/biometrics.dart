import 'package:do_it/config/constants.dart';
import 'package:do_it/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

final LocalAuthentication auth = LocalAuthentication();
Future<void> authenticate(BuildContext context) async {
  try {
    final bool isBiometricAvailable = await auth.canCheckBiometrics;
    final bool isDeviceSupported = await auth.isDeviceSupported();

    if (isBiometricAvailable && isDeviceSupported) {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate) {
   
      } else {
        Navigator.pushNamed(context, AppRoutes.dashboard);
      }
    } else {
      showErrorDialog(context, "Biometrics not supported on this device.");
    }
  } catch (e) {
    showErrorDialog(context, "Oops, an error occurred:");
  }
}



void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor:Colors.white ,
        title: Text('Error',
            style: TextStyle(fontFamily: font, color: Colors.black)),
        content: Text(message, style: const TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color:color)),
          ),
        ],
      );
    },
  );
}
