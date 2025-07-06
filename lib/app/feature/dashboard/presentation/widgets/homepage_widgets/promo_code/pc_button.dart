import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PcButton extends StatefulWidget {
  final ValueNotifier<String?>? selectedValue;

  const PcButton({super.key, required this.selectedValue});

  @override
  State<PcButton> createState() => _PcButtonState();
}

class _PcButtonState extends State<PcButton> {
  String _localSelected = "All"; // used only if selectedValue is null

  final List<String> chipLabels = [
    "All",
    "Bus",
    "Tours",
    "Reservation",
  ];

  @override
  Widget build(BuildContext context) {
    // Use ValueListenableBuilder if external selection is provided
    if (widget.selectedValue != null) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ValueListenableBuilder<String?>(
          valueListenable: widget.selectedValue!,
          builder: (context, currentValue, _) {
            return _buildChips(currentValue);
          },
        ),
      );
    }

    // If no external notifier, use internal local state
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _buildChips(_localSelected),
    );
  }

  Widget _buildChips(String? selected) {
    return Row(
      children: chipLabels.map((label) {
        final bool isSelected = selected == label;
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ChoiceChip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black12),
            ),
            backgroundColor: const Color(0xffF9F9FF),
            label: Text(
              label,
              style: TextStyle(fontSize: 11.sp),
            ),
            selected: isSelected,
            selectedColor: Colors.blueGrey.shade100,
            onSelected: (_) {
              if (widget.selectedValue != null) {
                widget.selectedValue!.value = label;
              } else {
                setState(() {
                  _localSelected = label;
                });
              }
            },
          ),
        );
      }).toList(),
    );
  }
}

