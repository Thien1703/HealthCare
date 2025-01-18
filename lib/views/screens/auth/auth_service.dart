import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _verificationId;

  /// Gửi mã OTP tới số điện thoại
  Future<void> sendOTPCode({
     required String phoneNo,
    required Function(String) onCodeSent,
    required Function(String) onError,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+84$phoneNo', // Việt Nam (+84)
        timeout: const Duration(seconds: 40),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Tự động xác thực (dành cho Android)
          print("Tự động xác thực thành công");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Xác thực thất bại: ${e.message}");
          onError(e.message ?? "Có lỗi xảy ra. Vui lòng thử lại.");
        },
        codeSent: (String verificationId, int? resendToken) {
          print("Mã OTP đã được gửi tới số điện thoại: +84$phoneNo");
          _verificationId = verificationId; // Lưu ID xác minh
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Hết thời gian tự động lấy mã OTP");
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      onError(e.toString());
    }
  }

  /// Xác minh mã OTP
  Future<String> verifyOTPCode({
    required String otp,
    // required String verifyId,
  }) async {
    try {
      if (_verificationId == null) {
        throw Exception("Không tìm thấy mã xác minh. Vui lòng thử lại.");
      }

      // Tạo credential từ mã OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      // Đăng nhập với Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Lưu số điện thoại vào Firestore
        await storePhoneNumber(userCredential.user!.phoneNumber!);
        return "success";
      } else {
        return "Nhập sai mã. Vui lòng kiểm tra mã OTP.";
      }
    } catch (e) {
      print("Xác minh mã OTP thất bại: $e");
      return e.toString();
    }
  }

  /// Lưu số điện thoại vào Firestore
  Future<void> storePhoneNumber(String phoneNumber) async {
    try {
      await _firestore.collection('users').doc(phoneNumber).set({
        'phoneNumber': phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("Lưu số điện thoại thành công: $phoneNumber");
    } catch (e) {
      print("Không thể lưu số điện thoại: $e");
    }
  }

  /// Đăng xuất người dùng
  Future<void> logOutUser() async {
    await _auth.signOut();
    print("Đã đăng xuất người dùng.");
  }
}
