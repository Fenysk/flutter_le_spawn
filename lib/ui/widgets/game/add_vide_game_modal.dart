import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class AddGameModal extends StatefulWidget {
  const AddGameModal({super.key});

  @override
  State<AddGameModal> createState() => _AddGameModalState();
}

class _AddGameModalState extends State<AddGameModal> {
  late CameraController _cameraController;
  late Future<void> _initializeCameraControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCameraControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeCameraControllerFuture;

      if (!mounted) return;

      final directory = await getTemporaryDirectory();
      final path = join(directory.path, '${DateTime.now()}.png');

      final picture = await _cameraController.takePicture();

      await picture.saveTo(path);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picture saved to $path')),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeCameraControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: CameraPreview(_cameraController),
              ),
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: _takePicture,
                    icon: const Icon(Icons.camera),
                    iconSize: 56,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
