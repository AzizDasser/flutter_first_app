import 'package:first_app/ui/pages/read.qr.page.dart';
import 'package:first_app/ui/pages/scan.qr.page.dart';
import 'package:flutter/material.dart';

import '../widgets/main.drawer.widget.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text("QRCode Page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CreateScreen()));
                  //print('creating qr code');
                },
                child: const Text('create QR code')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScanScreen()));
                  //print('Read qr code');
                },
                child: const Text('Read QR code')),
          ],
        ),
      ),
    );




  }
}