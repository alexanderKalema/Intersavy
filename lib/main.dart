import 'package:android_app_development/services/app_router.gr.dart';
import 'package:android_app_development/services/stop_watch_service.dart';
import 'package:android_app_development/utilities/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DateAndTimeProvider(),
        child: MaterialApp.router(
            theme: myTheme,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false));
  }
}
