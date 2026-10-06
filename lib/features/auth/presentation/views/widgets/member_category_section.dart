import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/member_category_column.dart';
import 'package:flutter/material.dart';

class MemberCategorySection extends StatelessWidget {
  const MemberCategorySection({
    super.key,
    this.memberType = 'Civilian',
    required this.onChanged,
  });
  final String memberType;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your member category',
          style: Styless.textStyle15.copyWith(
            color: const Color(0xFF202E34),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'This determines your monthly membership rate.',
          style: Styless.textStyle12.copyWith(color: const Color(0xFF929DA1)),
        ),
        const SizedBox(height: 10),
        MemberCategoryColumn(onChanged: onChanged, memberType: memberType),
      ],
    );
  }
}
