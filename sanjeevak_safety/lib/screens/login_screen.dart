import 'package:flutter/material.dart';
import 'package:sanjeevak_safety/screens/verify_otp.dart';
import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isTablet ? 500 : double.infinity,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/splash_logo.png',
                        height: isTablet ? 250 : size.height * 0.1,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 42),
                    const Text(
                      "Welcome Back 👋",
                      style: AppTextStyles.heading1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Log in to access emergency alerts, share your location, and connect with nearby services.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textColor.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Phone Number
                          Text(
                            "Phone Number",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: _mobileController, // Add controller here
                            hint: "Enter your phone number",
                            icon: Icons.phone,
                            inputType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Phone number is required.";
                              }
                              if (value.length != 10) {
                                return "Enter a valid 10-digit phone number.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Login Button (Redirect to OTP Verification)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  // Pass the mobile number to VerifyOtpScreen
                                  print("Passing mobile number: ${_mobileController.text}");

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyOtpScreen(mobileNumber: _mobileController.text),
                                    ),
                                  );

                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: isTablet ? 20 : 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text("Log in with OTP", style: Theme.of(context).textTheme.labelLarge),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Sign Up Prompt
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account yet? ",
                                  style: AppTextStyles.bodyText.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
