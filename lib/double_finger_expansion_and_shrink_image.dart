import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DoubleFingerExpansionAndShrinkImage extends StatelessWidget {
  const DoubleFingerExpansionAndShrinkImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('二本指で拡大縮小できる機能'),
        centerTitle: true,
      ),
      body: Center(
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          imageProvider: const AssetImage('assets/background.png'),
        ),
      ),
    );
  }
}
