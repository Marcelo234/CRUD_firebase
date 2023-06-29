import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrKey = GlobalKey();
  Barcode? scannedBarcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Escanear codigo QR'),
        backgroundColor: const Color.fromARGB(255, 77, 74, 74),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                scannedBarcode != null
                    ? 'QR Code: ${scannedBarcode!.code}'
                    : 'No QR code scanned',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedBarcode = scanData;
      });
    });
  }

  @override
  void dispose() {
    qrKey.currentState?.dispose();
    super.dispose();
  }
}
