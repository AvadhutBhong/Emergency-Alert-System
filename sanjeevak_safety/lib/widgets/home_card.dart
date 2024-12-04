import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const HomeCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

                Icon(
                  icon,
                  size: 40,
                  color: Colors.black54,
                ),
                 Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

               const Icon(
              Icons.arrow_forward_rounded,
              size: 30,
              color: Colors.black,
            ),

        ],
      ),
    );
  }
}
