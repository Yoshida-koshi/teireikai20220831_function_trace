import 'package:flutter/material.dart';
import 'package:teirei20220831/double_finger_expansion_and_shrink_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'teirei20220831',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TeireiImagePinchOut(),
    );
  }
}

class TeireiImagePinchOut extends StatelessWidget {
  const TeireiImagePinchOut({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('写真をタップしたらアップする機能'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: GestureDetector(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                )),
              ),
              onTap: () {
                showDialog(
                    barrierLabel: '',
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return Stack(alignment: Alignment.topCenter, children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InteractiveViewer(
                                minScale: 0.1,
                                maxScale: 3,
                                child: Image.asset('assets/background.png'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        )
                      ]);
                    });
              },
            ),
          ),
          Expanded(child: Container()),
          Container(
            height: 45,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              const DoubleFingerExpansionAndShrinkImage()));
                },
                child: const Text('二本指で拡大縮小できるページに遷移')),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
