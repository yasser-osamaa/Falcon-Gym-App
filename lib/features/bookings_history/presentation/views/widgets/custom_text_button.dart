import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 238, 216, 216),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: Text(
        'Cancel',
        style: Styless.textStyle15.copyWith(
          color: Color.fromARGB(255, 128, 92, 92),
        ),
      ),
    );
  }
}
