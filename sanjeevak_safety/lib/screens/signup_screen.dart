import 'package:flutter/material.dart';
import 'package:sanjeevak_safety/screens/verify_otp.dart';
import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                    // SizedBox(height: size.height * 0.05),
                    Center(
                      child: Image.asset(
                        'assets/images/splash_logo.png',
                        height: isTablet ? 250 : size.height * 0.1,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 42),
                    const Text(
                      "Create Account",
                      style: AppTextStyles.heading1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Join to quickly alert contacts, share your location, and access nearby emergency services.",
                      style: AppTextStyles.bodyText.copyWith(
                        color: AppColors.subduedTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Full Name
                          Text(
                            "Full Name",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: _fullNameController,
                            hint: "Enter your full name",
                            icon: Icons.person_outline,
                            inputType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Full name is required.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Email
                          Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: _emailController,
                            hint: "Enter your email",
                            icon: Icons.email_outlined,
                            inputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required.";
                              }
                              if (!RegExp(r"^[a-zA-Z0-9]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,}$").hasMatch(value)) {
                                return "Enter a valid email address.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Phone Number
                          Text(
                            "Phone Number",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: _phoneController,
                            hint: "Enter your phone number",
                            icon: Icons.phone_outlined,
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
                          const SizedBox(height: 30),

                          // Get OTP Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  // Pass controllers to the OTP screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyOtpScreen(mobileNumber: _phoneController.text),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                "Get OTP",
                                style: AppTextStyles.buttonText.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Already Have an Account
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Already have an account? ",
                                  style: AppTextStyles.bodyText.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: "Log in",
                                      style: TextStyle(
                                        color: AppColors.primaryColor, // Set this color for the "Log in" text
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
