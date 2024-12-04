import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/animation.dart';
import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String mobileNumber;

  VerifyOtpScreen({super.key, required this.mobileNumber});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> with SingleTickerProviderStateMixin {
  final _pinController = TextEditingController();
  bool _isOtpInvalid = false;

  late AnimationController _shakeController;
  late Animation<Offset> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _shakeAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.1, 0.0))
        .animate(CurvedAnimation(parent: _shakeController, curve: Curves.elasticInOut));

    // Reset OTP state when animation completes.
    _shakeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isOtpInvalid = false; // Reset the error state
        });
        _shakeController.reset(); // Reset the animation to its starting position
      }
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _validateOtp(String enteredOtp) {
    const correctOtp = "1234"; // Replace with actual OTP validation logic.

    if (enteredOtp != correctOtp) {
      setState(() {
        _isOtpInvalid = true;
      });
      _shakeController.forward(from: 0);
      _pinController.clear();// Trigger the shake animation
    } else {
      setState(() {
        _isOtpInvalid = false;
      });
      Navigator.pushNamed(context, '/home'); // Navigate to home screen on success
    }
  }

  void _resendOtp() {
    // Logic to resend OTP goes here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent! Please check your phone.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
        color: Colors.white,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP", style: AppTextStyles.heading2,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                "Verification code sent to: ${widget.mobileNumber}", // Display the mobile number
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter the 4-digit OTP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),

              // Add shake animation when OTP is invalid
              SlideTransition(
                position: _shakeAnimation,
                child: Pinput(
                  length: 4,
                  controller: _pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primaryColor),
                      color: Colors.white,
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.redAccent),
                      color: Colors.white,
                    ),
                  ),
                  onCompleted: _validateOtp,
                ),
              ),
              const SizedBox(height: 25),
              if (_isOtpInvalid)
                const Text(
                  "Invalid OTP. Please try again.",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _validateOtp(_pinController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text("Verify OTP"),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _resendOtp,
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
