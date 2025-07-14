import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClipButton extends StatelessWidget {
  final ValueNotifier<String> selectedValue;

  ClipButton({super.key, required this.selectedValue});

  final List<String> chipLabels = [
    "All",
    "Bus",
    "Tours",
    "Reservation",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ValueListenableBuilder<String>(
        valueListenable: selectedValue,
        builder: (context, currentValue, _) {
          return Row(
            children: chipLabels.map((label) {
              final bool isSelected = currentValue == label;
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ChoiceChip(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black12),
                  ),
                  backgroundColor: const Color(0xffF9F9FF),
                  label: Text(label, style: TextStyle(fontSize: 11.sp)),
                  selected: isSelected,
                  selectedColor: Colors.blueGrey.shade100,
                  onSelected: (_) {
                    selectedValue.value = label;
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
