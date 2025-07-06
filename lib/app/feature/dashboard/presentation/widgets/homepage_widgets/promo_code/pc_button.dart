import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PcButton extends StatelessWidget {
  PcButton({super.key});

  final ValueNotifier<String> selectedValue = ValueNotifier<String>("");

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
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ChoiceChip(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Fully rounded
                    side: const BorderSide(color: Colors.black12),
                  ),
                  backgroundColor: const Color(0xffF9F9FF),
                  label: Text(
                    label,
                    style: TextStyle(fontSize: 11.sp),
                  ),
                  selected: currentValue == label,
                  selectedColor: Colors.blueGrey.shade100,
                  onSelected: (bool isSelected) {
                    if (isSelected) {
                      selectedValue.value = label;
                    }
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
