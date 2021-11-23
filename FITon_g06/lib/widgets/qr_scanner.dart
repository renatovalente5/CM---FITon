import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// ignore: must_be_immutable
class QrScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode barcode;
  QRViewController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if(Platform.isAndroid) {
      await controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrView(context),
            Positioned(bottom: 20, child: buildResult()),
            Positioned(top: 20, child: buildControlBtns())
          ],
        ),
      ),
    );
  }

  Widget buildResult() {
    // call add page with barcode.code
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: Text(
        barcode != null ? 'User result: ${barcode.code}' : 'Scan your friend\'s QR',
        maxLines: 3,
      ),
    );
  }

  Widget buildControlBtns() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: FutureBuilder<bool>(
              future: controller.getFlashStatus(),
              builder: (context, snapshot) {
                if(snapshot.data != null) {
                  return Icon(
                    snapshot.data ? Icons.flash_on : Icons.flash_off
                  );
                } else {
                  return Container();
                }
              }
            ),
            onPressed: () async {
              await controller.toggleFlash();
              setState(() {});
            },
          ),
          IconButton(
            icon: FutureBuilder(
              future: controller.getCameraInfo(),  
              builder: (context, snapshot) {
                if(snapshot.data != null) {
                  return Icon(Icons.switch_camera);
                } else {
                  return Container();
                }
              }
            ),
            onPressed: () async {
              await controller.flipCamera();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.lightBlue,
        borderRadius: 5,
        borderLength: 20,
        borderWidth: 15,
        cutOutSize: MediaQuery.of(context).size.width * 0.8, 
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
      .listen((barcode) => setState(() => this.barcode = barcode));
  }
}