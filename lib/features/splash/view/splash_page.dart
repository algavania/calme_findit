import 'package:auto_route/auto_route.dart';
import 'package:calme/database/db_helper.dart';
import 'package:calme/database/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/router.gr.dart';
import '../../../widgets/logo_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      PageRouteInfo data = const LoginRoute();
      if (SharedPreferencesService.getIsFirstTime()) {
        data = const LandingRoute();
      }
      if (DbHelper.auth.currentUser != null) {
        data = const DashboardRoute();
      }

      AutoRouter.of(context).replace(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(10.w),
        child: const Center(
          child: LogoWidget(),
        ),
      )),
    );
  }
}
