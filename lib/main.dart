import 'package:flutter/material.dart';
import 'package:flutter_skeleton/screens/splash/splash.dart';
import 'package:flutter_skeleton/utils/bindings.dart';
import 'package:flutter_skeleton/utils/storage_constants.dart';
import 'package:flutter_skeleton/utils/themes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(box);
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Skeleton',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Splash(),
      );
    });
  }
}
