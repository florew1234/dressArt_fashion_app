import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dressart/myMeasures.dart';
import 'package:flutter/material.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prendre une photo')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

            if (!context.mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Column(
        children: [
          Image.file(File(imagePath)),

          Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              // height: 50,
              child: ElevatedButton(
              
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyMeasures())
                  ),
                  child: const Text('Mes mesures', style: TextStyle(color: Colors.black, fontSize: 20),),),
            )
        ],
      ),
    );
    
  }
}
