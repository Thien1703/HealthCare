// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_care/views/screens/auth/register/otp_popup.dart';

class AuthService {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // String? _verificationId;

//   /// Gửi mã OTP tới số điện thoại
//   Future<void> sendOTPCode({
//   required String phoneNo,
//   required Function(String) onCodeSent,
//   required Function(String) onError,
// }) async {
//   try {
//     // Kiểm tra định dạng số điện thoại Việt Nam
//     final isValidPhoneNumber = RegExp(r'^((\+84)|0)\d{9}$').hasMatch(phoneNo);

//     if (!isValidPhoneNumber) {
//       onError("Số điện thoại không hợp lệ. Vui lòng nhập đúng định dạng.");
//       return;
//     }

//     // Loại bỏ ký tự '0' đầu nếu có (vì Firebase chỉ cần +84)
//     final formattedPhone =
//         phoneNo.startsWith('0') ? '+84${phoneNo.substring(1)}' : phoneNo;

//     await _auth.verifyPhoneNumber(
//       phoneNumber: formattedPhone,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Tự động xác thực
//         print("Tự động xác thực thành công");
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print("Xác thực thất bại: ${e.code} - ${e.message}");
//         onError(e.message ?? "Có lỗi xảy ra. Vui lòng thử lại.");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         print("OTP sent to: $formattedPhone");
//         _verificationId = verificationId;
//         onCodeSent(verificationId);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         // Hết thời gian tự động lấy mã OTP
//         print("Timeout - Verification ID: $verificationId");
//         _verificationId = verificationId;
//       },
//     );
//   } catch (e) {
//     onError("Lỗi không xác định: ${e.toString()}");
//   }
// }

//   /// Xác minh mã OTP
//   Future<String> verifyOTPCode({
//     required String otp,
//   }) async {
//     try {
//       // Kiểm tra định dạng mã OTP
//       if (otp.isEmpty ||
//           otp.length != 6 ||
//           !RegExp(r'^[0-9]+$').hasMatch(otp)) {
//         return "Mã OTP không hợp lệ. Vui lòng nhập đúng mã 6 chữ số.";
//       }

//       if (_verificationId == null) {
//         return "Không tìm thấy mã xác minh. Vui lòng thử lại.";
//       }

//       // Tạo credential từ mã OTP
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId!,
//         smsCode: otp,
//       );

//       // Đăng nhập với Firebase
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       if (userCredential.user != null) {
//         // Lưu số điện thoại vào Firestore
//         await storePhoneNumber(userCredential.user!.phoneNumber!);
//         return "success";
//       } else {
//         return "Không thể đăng nhập. Vui lòng thử lại.";
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-verification-code') {
//         return "Mã OTP không đúng. Vui lòng kiểm tra và thử lại.";
//       } else if (e.code == 'session-expired') {
//         return "Phiên làm việc đã hết hạn. Vui lòng gửi lại mã OTP.";
//       }
//       return "Lỗi xác thực: ${e.message}";
//     } catch (e) {
//       return "Lỗi không xác định: ${e.toString()}";
//     }
//   }

//   /// Lưu số điện thoại vào Firestore
//   Future<void> storePhoneNumber(String phoneNumber) async {
//     try {
//       final docRef = _firestore.collection('users').doc(phoneNumber);
//       final docSnapshot = await docRef.get();

//       if (!docSnapshot.exists) {
//         await docRef.set({
//           'phoneNumber': phoneNumber,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         print("Lưu số điện thoại thành công: $phoneNumber");
//       } else {
//         print("Người dùng đã tồn tại: $phoneNumber");
//       }
//     } catch (e) {
//       print("Không thể lưu số điện thoại: $e");
//     }
//   }

//   /// Đăng xuất người dùng
//   Future<void> logOutUser() async {
//     try {
//       await _auth.signOut();
//       print("Đã đăng xuất người dùng.");
//     } catch (e) {
//       print("Lỗi khi đăng xuất người dùng: $e");
//     }
//   }
}

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
