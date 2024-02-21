import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class StoryCaptureScreen extends StatefulWidget {
  const StoryCaptureScreen({super.key});

  @override
  State<StoryCaptureScreen> createState() => _StoryCaptureScreenState();
}

class _StoryCaptureScreenState extends State<StoryCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.custom(
        saveConfig: SaveConfig.photo(),
        builder: (state, preview) {
          state.captureState$.listen(
            (mediaCapture) {
              if (mediaCapture != null) {
                mediaCapture.captureRequest.when(single: (single) {
                  // TODO: Upload story
                });
              }
            },
          );

          return AwesomeCameraLayout(state: state);
        },
      ),
    );
  }
}
