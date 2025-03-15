import 'package:flutter/material.dart';
import 'package:training/widget/radio_text.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  final bool isActive;

  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kinh doanh vận tải',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: RadioText(
                value: false,
                groupValue: isActive,
                onChanged: onChanged,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: RadioText(
                value: true,
                groupValue: isActive,
                onChanged: onChanged,
              ),
            ),
          ],
        )
      ],
    );
  }
}
