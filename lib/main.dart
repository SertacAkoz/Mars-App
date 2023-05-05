import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mars_app/di/dependecy_injection.dart';
import 'package:mars_app/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  DependecyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Main Dart Clicked');
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: const Color(0xFF432BFF)),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.routeGenerator,
        title: 'Mars App',
        initialRoute: '/assetList',
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Material App Bar'),
        //   ),
        //   body: const Center(
        //     child: Text('Hello World'),
        //   ),
        // ),
      ),
    );
  }
}
