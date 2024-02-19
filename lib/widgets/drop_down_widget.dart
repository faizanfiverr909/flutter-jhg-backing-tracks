import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:blocking_tracks/resources/CustomColors.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.closedColor,
    this.expandedColor,
    this.hint,
    this.label,
  });

  final String? value;
  final String? hint;
  final List<String>? items;
  final Color? closedColor;
  final Color? expandedColor;
  final String? label;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.titleMedium!.copyWith(
        overflow: TextOverflow.ellipsis, color: CustomColors.textHeadingColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(label!),
          ),
        CustomDropdown<String>(
          closedHeaderPadding:
              EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          // hideSelectedFieldWhenExpanded: true,
          hintText: hint,
          decoration: CustomDropdownDecoration(
            closedFillColor: closedColor ?? CustomColors.liteWhite,
            expandedFillColor: expandedColor ?? CustomColors.liteWhite,
            listItemStyle: style,
            closedSuffixIcon:
                Icon(Icons.arrow_drop_down, color: CustomColors.textHeadingColor),
            expandedSuffixIcon: Icon(Icons.arrow_drop_up_rounded,
                color: CustomColors.textHeadingColor),
            headerStyle: style,
          ),
          initialItem: value == null
              ? items != null
                  ? items!.first
                  : null
              : value,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
