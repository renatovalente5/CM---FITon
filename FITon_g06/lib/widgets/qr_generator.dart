import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatelessWidget {
  final username = 'username';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: username,
                size: 200,
                backgroundColor: Colors.blue.shade300,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),  
      ),
    );
  }
}