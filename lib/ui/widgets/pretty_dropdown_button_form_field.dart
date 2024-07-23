import 'package:flutter/material.dart';

class PrettyDropdownButtonFormField<T> extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final FormFieldValidator<T>? validator;
  final double? margin;

  const PrettyDropdownButtonFormField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.validator,
    this.margin = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin!),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelText: label,
          // filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        items: items,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
