import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARViewerScreen extends StatelessWidget {
  final String modelUrl;

  const ARViewerScreen({required this.modelUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Viewer')),
      body: ModelViewer(
        backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: modelUrl,
        alt: 'A 3D model of the gadget',
        ar: true,
        autoRotate: true,
        disableZoom: true,
      ),
    );
  }
}
