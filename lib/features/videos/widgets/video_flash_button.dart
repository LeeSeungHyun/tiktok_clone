import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class VideoFlashButton extends StatelessWidget {
  final FlashMode currentFlashMode;
  final FlashMode flashMode;
  final Future<void> Function(FlashMode newFlashMode) setFlashMode;
  final IconData icon;

  const VideoFlashButton({
    super.key,
    required this.currentFlashMode,
    required this.flashMode,
    required this.icon,
    required this.setFlashMode,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color:
          currentFlashMode == flashMode ? Colors.amber.shade200 : Colors.white,
      onPressed: () => setFlashMode(flashMode),
      icon: Icon(icon),
    );
  }
}
