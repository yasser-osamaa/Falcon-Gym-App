import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 42,
        child: FilledButton.icon(
          onPressed: null,
          icon: isLoading ? null : const Icon(Icons.logout, size: 17),
          label: isLoading
              ? Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Color(0xffB24C4C),
                      strokeWidth: 2,
                    ),
                  ),
                )
              : Text(
                  'Log out',
                  style: Styless.textStyle12.copyWith(
                    color: const Color(0xffB24C4C),
                    fontWeight: FontWeight.w700,
                  ),
                ),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xffF9EEEE),
            disabledBackgroundColor: const Color(0xffF9EEEE),
            disabledForegroundColor: const Color(0xffB24C4C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
