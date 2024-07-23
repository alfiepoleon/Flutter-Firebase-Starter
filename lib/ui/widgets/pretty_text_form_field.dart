import 'package:flutter/material.dart';

class PrettyTextFormField extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double? margin;
  final bool? obscureText;
  final TextInputType? keyboardType;

  const PrettyTextFormField({
    super.key,
    required this.label,
    this.onChanged,
    this.validator,
    this.margin = 5,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin!),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          // filled: true, // Material 3 filled style
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            // borderSide: BorderSide.none, // Remove default border
          ),
        ),
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText!,
        keyboardType: keyboardType!,
      ),
    );
  }
}
