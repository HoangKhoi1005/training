import 'package:flutter/material.dart';

class RadioText extends StatelessWidget {
  const RadioText({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final bool value;

  final bool groupValue;

  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {

    void onTap() {
      onChanged(value);
    }

    final label = value ? 'Có' : 'Không';

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
