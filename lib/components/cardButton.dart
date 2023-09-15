import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';

class CardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String buttonText;
  final double imageSize;
  final double buttonTextSize;
  final double containerHeight;

  const CardButton({
    required this.onPressed,
    required this.image,
    required this.buttonText,
    this.imageSize = 20.0,
    this.buttonTextSize = 20.0,
    this.containerHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: containerHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 8),
              Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorTheme().darkGray.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
