import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class AuthToggle extends StatelessWidget {
  const AuthToggle({
    super.key,
    this.isCreateAccountSelected = false,
    required this.onChanged,
  });

  final bool isCreateAccountSelected;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF1F0),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                alignment: Alignment.center,
                decoration: _decoration(!isCreateAccountSelected),
                child: Text(
                  'Sign in',
                  style: Styless.textStyle12.copyWith(
                    color: !isCreateAccountSelected
                        ? const Color(0xFF202E34)
                        : const Color(0xFF69757A),
                    fontWeight: !isCreateAccountSelected
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                alignment: Alignment.center,
                decoration: _decoration(isCreateAccountSelected),
                child: Text(
                  'Create account',
                  style: Styless.textStyle12.copyWith(
                    color: isCreateAccountSelected
                        ? const Color(0xFF202E34)
                        : const Color(0xFF69757A),
                    fontWeight: isCreateAccountSelected
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration(bool selected) {
    return BoxDecoration(
      color: selected ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(9),
      boxShadow: selected
          ? const [
              BoxShadow(
                color: Color(0x14202E34),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ]
          : null,
    );
  }
}
