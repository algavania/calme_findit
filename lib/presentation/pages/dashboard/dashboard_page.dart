import 'package:auto_route/auto_route.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../routes/router.gr.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MeditationRoute(),
        ArticleRoute(),
        JournalRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(UniconsLine.estate),
              label: AppLocalizations.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(UniconsLine.headphones_alt),
              label: AppLocalizations.of(context).meditation,
            ),
            BottomNavigationBarItem(
              icon: const Icon(UniconsLine.newspaper),
              label: AppLocalizations.of(context).article,
            ),
            BottomNavigationBarItem(
              icon: const Icon(UniconsLine.file_alt),
              label: AppLocalizations.of(context).journal,
            ),
            BottomNavigationBarItem(
              icon: const Icon(UniconsLine.user),
              label: AppLocalizations.of(context).profile,
            ),
          ],
        );
      },
    );
  }
}
