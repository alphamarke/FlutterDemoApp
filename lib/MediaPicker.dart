import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_picker/media_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class MediaPickerPage extends StatefulWidget {
  static String id = 'MediaPickerPage';

  @override
  _MediaPickerPageState createState() => new _MediaPickerPageState();
}

class _MediaPickerPageState extends State<MediaPickerPage> {
  String _platformVersion = 'Unknown';
  VideoPlayerController videoController = null;
  VoidCallback videoPlayerListener;
  List<dynamic> _mediaPaths;
  Widget mediaViewer;
  String imagePath = '';

  @override
  initState() {
    super.initState();
    permissions();
    pickImages();
  }

  void permissions() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    Map<PermissionGroup, PermissionStatus> permissions2 =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);

    Map<PermissionGroup, PermissionStatus> permissions3 =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.mediaLibrary]);
  }

  @override
  dispose() {
    super.dispose();

    videoController?.dispose();
    videoController = null;
  }

  pickImages() async {
    try {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.mediaLibrary);

      print('permission' + permission.toString());

      if (permission == null) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.mediaLibrary]);
      }

      _mediaPaths = await MediaPicker.pickImages(quantity: 1, withVideo: false);

//      filter only images from mediaPaths and send them to the compressor
//      List<dynamic> listCompressed = await MediasPicker.compressImages(imgPaths: [firstPath], maxWidth: 600, maxHeight: 600, quality: 100);
//      print(listCompressed);

    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _platformVersion = _mediaPaths.toString();
      imagePath = _mediaPaths
          .toString()
          .substring(2, _mediaPaths.toString().length - 1);

      //print('imagePath : ' + imagePath);
    });
  }

  pickVideos() async {
    try {
      _mediaPaths = await MediaPicker.pickVideos(quantity: 1);
    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _platformVersion = _mediaPaths.toString();
      String videoPath = _mediaPaths
          .toString()
          .substring(1, _mediaPaths.toString().length - 1);
      print('videoPath : ' + videoPath);
      _startVideoPlayer(videoPath);
    });
  }

  Future<void> _startVideoPlayer(videoPath) async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      body: new Center(
        child: new Column(
          children: [
            videoController != null
                ? AspectRatio(
                    aspectRatio: videoController.value.size != null
                        ? videoController.value.aspectRatio
                        : 1.0,
                    child: VideoPlayer(videoController))
                : Container(),
            Image.file(File(imagePath)),
            new Text('Running on: $_platformVersion\n'),
            new MaterialButton(
              child: new Text(
                "Pick images",
              ),
              onPressed: () => pickImages(),
            ),
            new MaterialButton(
              child: new Text(
                "Pick just videos",
              ),
              onPressed: () => pickVideos(),
            ),
            new MaterialButton(
              child: new Text(
                "Delete temp folder (automatic on ios)",
              ),
              onPressed: () async {
                if (await MediaPicker.deleteAllTempFiles()) {
                  setState(() {
                    _platformVersion = "deleted";
                  });
                } else {
                  setState(() {
                    _platformVersion = "not deleted";
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
