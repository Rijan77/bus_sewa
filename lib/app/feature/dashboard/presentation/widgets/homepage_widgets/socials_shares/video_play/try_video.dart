import 'package:flutter/material.dart';

import '../../../../../data/models/video_model.dart';

class TryVideo extends StatefulWidget {
  final VideoModel model;

  const TryVideo({super.key, required this.model});

  @override
  State<TryVideo> createState() => _TryVideoState();
}

class _TryVideoState extends State<TryVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
