import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sanjeevak_safety/utils/app_colors.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  final _mobileController = TextEditingController();

  bool _isOtpInvalid = false;
  bool _otpSent = false;

  late AnimationController _animationController;
  late Animation<double> _shakeAnimation;

  void _sendOtp() {
    // Simulate sending OTP and move to OTP input screen
    setState(() {
      _otpSent = true;
    });
  }

  void _validateOtp(String enteredOtp) {
    const correctOtp = "1234"; // Replace with actual validation logic.

    if (enteredOtp != correctOtp) {
      setState(() {
        _isOtpInvalid = true;
      });
      _animationController.forward(); // Trigger shake animation
      _pinController.clear(); // Clear OTP field for a fresh attempt
    } else {
      setState(() {
        _isOtpInvalid = false;
      });
      Navigator.pushNamed(context, '/resetPassword'); // Navigate to next screen on success
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 8).chain(
      CurveTween(curve: Curves.elasticIn),
    ).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset(); // Reset animation after shaking.
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[800]!),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // Mobile Number Input
              if (!_otpSent)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter your Mobile Number",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _sendOtp,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: AppColors.secondaryColor,
                        ),
                        child: const Text("Send OTP"),
                      ),
                    ),
                  ],
                ),
              // OTP Input Fields
              if (_otpSent)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter the 4-digit OTP",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                      animation: _shakeAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _isOtpInvalid ? _shakeAnimation.value : 0,
                            0,
                          ),
                          child: child,
                        );
                      },
                      child: Pinput(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        length: 4,
                        controller: _pinController,
                        defaultPinTheme: defaultPinTheme,
                        autofocus: true,
                        onCompleted: _validateOtp,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
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
                          padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: const Text("Verify OTP"),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _otpSent = false; // Reset after resend OTP
                          _mobileController.clear();
                        });
                      },
                      child: const Text("Resend OTP"),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
