import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
