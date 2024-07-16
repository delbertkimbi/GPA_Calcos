import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class ResultPage extends StatefulWidget {
  final double cwgp;
  final double ccv;
  final double gpa;
  const ResultPage({
    super.key,
    required this.ccv,
    required this.cwgp,
    required this.gpa,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ScreenshotController _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'GPA Result',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Screenshot(
            controller: _screenshotController,
            child: Container(
              height: 300.h,
              margin: EdgeInsets.symmetric(
                vertical: 40.r,
                horizontal: 30.r,
              ),
              padding: EdgeInsets.all(31.r),
              decoration: BoxDecoration(
                  color: MainColors.color2,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black.withOpacity(0.3.r),
                      color: const Color(0xff9191F5),
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 25.0.r,
                      spreadRadius: 1.0.r,
                    ),
                    BoxShadow(
                      // color: Colors.black.withOpacity(0.3.r),
                      color: MainColors.color4,
                      offset: const Offset(-4.0, -4.0),
                      blurRadius: 5.0.r,
                      spreadRadius: 1.0.r,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Your Results!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: MainColors.color1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Text(
                    'CWGP: ${widget.cwgp.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2.r,
                  ),
                  Text(
                    'CCV: ${widget.ccv.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2.r,
                  ),
                  Text(
                    'G P A : ${widget.gpa.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.r, 0, 10.r, 0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()=> _takeScreenShot,
                    child: shareSave(text: 'Share', icon: Icons.share),
                  ),
                  SizedBox(
                    width: 20.r,
                  ),
                  shareSave(text: 'Save', icon: Icons.save),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container shareSave({required String text, required IconData icon}) {
    return Container(
      width: 120.w,
      height: 50.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
          color: MainColors.color1,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              // color: Colors.black.withOpacity(0.3.r),
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 25.0.r,
              spreadRadius: 1.0.r,
            ),
            BoxShadow(
              // color: Colors.black.withOpacity(0.3.r),
              color: MainColors.color4,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 5.0.r,
              spreadRadius: 1.0.r,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: MainColors.color4,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            width: 10.r,
          ),
          Icon(
            icon,
            color: Colors.yellow,
            size: 20.r,
          )
        ],
      ),
    );
  }

  void _takeScreenShot() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Capturing screenshot...'),
        duration: Duration(milliseconds: 200), // Adjust duration as needed
      ),
    );

    await Future.delayed(const Duration(milliseconds: 200)); // Wait for 200ms
    final imageFile = await _screenshotController.capture();

    if (imageFile != null) {
      // Request storage permission
      if (await Permission.storage.request().isGranted) {
        // Permission granted, proceed with sharing
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/screenshot.png');
        await file.writeAsBytes(imageFile);

        await Share.shareXFiles([XFile(file.path)], // Use path for sharing
            text: 'My GPA calculated by GPA Calcos');
      } else {
        // Handle permission denied scenario (optional)
        showToast(message: 'Storage permission denied');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Storage permission is required to share the screenshot.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      // Handle scenario where screenshot capture fails (optional)
      showToast(message: 'Failed to capture screenshot');
    }
  }
}
