import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera.dart';
import 'models.dart';

class ExampleCameraOverlay extends StatefulWidget {
  const ExampleCameraOverlay(
      {Key? key,
      this.isSelfie = false,
      this.recordVideo = false,
      this.iscnic = false,
      this.idCard = 'ID card',
      this.cnicCard = 'Cnic card',
      this.model})
      : super(key: key);
  final bool isSelfie;
  final bool recordVideo;
  final bool iscnic;
  final String idCard;
  final String cnicCard;
  final OverlayModel? model;

  @override
  // ignore: library_private_types_in_public_api
  _ExampleCameraOverlayState createState() => _ExampleCameraOverlayState();
}

class _ExampleCameraOverlayState extends State<ExampleCameraOverlay> {
  OverlayFormat format = OverlayFormat.cardID1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No camera found',
                    style: TextStyle(color: Colors.black),
                  ));
            }

            return CameraOverlay(
                widget.isSelfie ? snapshot.data![1] : snapshot.data!.first,
                widget.model ?? CardOverlay.byFormat(format),
                (XFile file) async {
              // Get.back(result: file.path);
              Navigator.of(context).pop(file.path);
            },
                isSelfie: widget.isSelfie,
                recordVideo: widget.recordVideo,
                isCnic: widget.iscnic,
                info: widget.isSelfie
                    ? 'Position your Face within the circle and ensure the image is perfectly readable.'
                    : 'Position your ${widget.idCard}${widget.cnicCard} within the rectangle and ensure the image is perfectly readable.',
                label: 'Scanning ID Card');
          } else {
            return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Fetching cameras',
                  style: TextStyle(color: Colors.black),
                ));
          }
        },
      ),
    );
  }
}
