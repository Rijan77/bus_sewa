
import 'package:flutter/material.dart';

class ClipButton extends StatefulWidget {
  const ClipButton({super.key});

  @override
  State<ClipButton> createState() => _ClipButtonState();
}

class _ClipButtonState extends State<ClipButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learn Choice Clip",)),
    );
  }
}
