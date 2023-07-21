import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kistpay_chikoo/widgets/loader_dialog.dart';

import '../custom_painter.dart';
import 'models.dart';
import 'overlay_shape.dart';

typedef XFileCallback = void Function(XFile file);

class CameraOverlay extends StatefulWidget {
  const CameraOverlay(this.camera, this.model, this.onCapture,
      {Key? key,
      this.flash = false,
      this.enableCaptureButton = true,
      this.label,
      this.info,
      this.loadingWidget,
      this.infoMargin,
      this.isSelfie = false,
      this.recordVideo = false,
      this.isCnic = false})
      : super(key: key);
  final CameraDescription camera;
  final OverlayModel model;
  final bool flash;
  final bool enableCaptureButton;
  final XFileCallback onCapture;
  final String? label;
  final String? info;

  final Widget? loadingWidget;
  final EdgeInsets? infoMargin;
  final bool isSelfie;
  final bool recordVideo;
  final bool isCnic;

  @override
  // ignore: library_private_types_in_public_api
  _FlutterCameraOverlayState createState() => _FlutterCameraOverlayState();
}

class _FlutterCameraOverlayState extends State<CameraOverlay>
    with SingleTickerProviderStateMixin {
  _FlutterCameraOverlayState();

  late CameraController controller;
  AnimationController? _animationController;
  Animation? _colorTween;
  bool _alreadyCheckingImage = false;

  bool showLottie = false;
  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.camera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      if (widget.isSelfie) {}
      if (widget.recordVideo) {
        _animationController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 300),
        );
        _colorTween = ColorTween(
          begin: Colors.red,
          end: Colors.green,
        ).animate(_animationController!);
      }
      setState(() {});
    });
  }

  bool isRecording = false;
  void _onPressed() async {
    setState(() {
      if (_animationController?.isCompleted ?? false) {
        _animationController?.reverse();
      } else {
        _animationController?.forward();
      }
    });

    if (!isRecording) {
      isRecording = true;
      await controller.prepareForVideoRecording();
      await controller.startVideoRecording();
      await Future.delayed(const Duration(seconds: 6), () {
        if (mounted) {
          setState(() {
            showLottie = true;
          });
        }
      });
      await Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setState(() {
            showLottie = false;
          });
        }
      });
    } else {
      XFile file = await controller.stopVideoRecording();
      widget.onCapture(file);
    }
  }

  @override
  void dispose() {
    final CameraController cameraController = controller;
    _animationController?.dispose();
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }

    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (!cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.stopImageStream();
    } else if (state == AppLifecycleState.resumed) {}
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingWidget = widget.loadingWidget ??
        Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: const Align(
            alignment: Alignment.center,
            child: Text('loading camera'),
          ),
        );

    if (!controller.value.isInitialized) {
      return loadingWidget;
    }

    controller
        .setFlashMode(widget.flash == true ? FlashMode.auto : FlashMode.off);
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(
            controller,
          ),
        ),
        _alreadyCheckingImage?const CircularProgressIndicator():const SizedBox(),
        widget.isSelfie
            ? CustomPaint(
                size: MediaQuery.of(context).size,
                painter: HolePainter(),
              )
            : OverlayShape(widget.model, selfie: widget.isSelfie),
        if (widget.label != null || widget.info != null)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: widget.infoMargin ??
                    const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (widget.label != null)
                    //   Text(
                    //     widget.label!,
                    //     style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 24,
                    //         fontWeight: FontWeight.w700),
                    //   ),
                    if (widget.info != null)
                      Flexible(
                        child: Text(
                          widget.info!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                )),
          ),
        if (widget.enableCaptureButton)
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
                color: Colors.transparent,
                child: widget.recordVideo
                    ? AnimatedBuilder(
                        animation: _animationController!,
                        builder: (context, child) => FloatingActionButton(
                          backgroundColor: _colorTween!.value,
                          onPressed: _onPressed,
                          child: Icon(_animationController!.isCompleted
                              ? Icons.stop
                              : Icons.fiber_manual_record),
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        margin: const EdgeInsets.all(25),
                        child: IconButton(
                          enableFeedback: true,
                          color: Colors.white,
                          onPressed: () async {
                            setState(() {
                              _alreadyCheckingImage=false;
                            });
                            if (!widget.recordVideo) {
                              for (int i = 10; i > 0; i--) {
                                await HapticFeedback.selectionClick();
                              }
                              if (widget.isSelfie) {
                                // ignore: use_build_context_synchronously
                                LoadingDialog.showLoadingDialog(
                                    context: context);
                                XFile file = await controller.takePicture();
                                setState(() {
                                  _alreadyCheckingImage=false;
                                });
                                // ignore: use_build_context_synchronously
                                // Navigator.of(context).pop(file);
                                Navigator.of(context, rootNavigator: true).pop();
                                widget.onCapture(file);
                              } else {
                                // ignore: use_build_context_synchronously
                                LoadingDialog.showLoadingDialog(
                                    context: context);
                                XFile file = await controller.takePicture();
                                setState(() {
                                  _alreadyCheckingImage=false;
                                });
// ignore: use_build_context_synchronously
//                                 Navigator.of(context).pop(file.path);
                                Navigator.of(context, rootNavigator: true).pop();
                                widget.onCapture(file);
                              }
                            } else {}
                          },
                          icon: const Icon(
                            Icons.camera,
                          ),
                          iconSize: 72,
                        ))),
          ),
      ],
    );
  }
}
