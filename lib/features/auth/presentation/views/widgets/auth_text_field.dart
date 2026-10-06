import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.fieldHeight = 70,
    this.labelFontSize = 15,
    this.validator,
    this.onSaved,
  });

  final String label;
  final String hintText;
  final bool obscureText;
  final double fieldHeight;
  final double labelFontSize;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            style: Styless.textStyle15.copyWith(
              color: const Color(0xFF202E34),
              fontWeight: FontWeight.w600,
              fontSize: widget.labelFontSize,
            ),
          ),
          const SizedBox(height: 7),
        ],
        SizedBox(
          height: widget.fieldHeight,
          child: TextFormField(
            onSaved: widget.onSaved,
            validator: widget.validator,
            obscureText: _obscureText,
            style: Styless.textStyle15.copyWith(color: const Color(0xFF202E34)),
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 18,
                      ),
                    )
                  : null,

              hintStyle: Styless.textStyle12.copyWith(
                color: const Color(0xFF9AA4A8),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: widget.fieldHeight < 70 ? 10 : 18,
              ),
              filled: true,
              fillColor: const Color(0xFFFBFCFB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E7E5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E7E5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF879398)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
