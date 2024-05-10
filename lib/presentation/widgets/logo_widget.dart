import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/l10n.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset('assets/core/logo.png', width: 50, height: 50,),
      const SizedBox(width: 5),
      Text(AppLocalizations.of(context).calme, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 40),)
    ],);
  }
}
