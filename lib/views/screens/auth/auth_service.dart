// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_care/views/screens/auth/register/otp_popup.dart';

phoneNumberVerification({
  required String phoneNumber,
  required BuildContext context,
}) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPPopup(verificationID: verificationId),));
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
