import 'package:calme/core/app_theme_data.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/database/shared_preferences_service.dart';
import 'package:calme/firebase_options.dart';
import 'package:calme/injector/injector.dart';
import 'package:calme/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Injector.init();
  await Injector.instance.allReady();
  await SharedPreferencesService.init();
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
    return Sizer(builder: (_, __, ___) {
      return GlobalLoaderOverlay(
        useDefaultLoading: false,
        closeOnBackButton: false,
        overlayWidgetBuilder: (_) => const Center(
            child: SpinKitChasingDots(
          color: ColorValues.primary50,
          size: 50.0,
        )),
        child: MaterialApp.router(
          theme: AppThemeData.getTheme(context),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}
