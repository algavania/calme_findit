import 'package:auto_route/auto_route.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/rounded_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            const SizedBox(height: Styles.defaultPadding),
            _buildAppBar(),
            const SizedBox(height: Styles.defaultSpacing),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileBody(),
                    const SizedBox(height: Styles.defaultSpacing),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfo(),
          const SizedBox(height: Styles.defaultSpacing),
          _buildMyActivity(),
          const SizedBox(height: Styles.defaultSpacing),
          _buildHelpCenter(),
        ],
      ),
    );
  }

  Widget _buildMyActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Styles.biggerSpacing),
        Text(AppLocalizations.of(context).myActivity,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Styles.biggerSpacing),
        _buildButton(
            icon: UniconsLine.history,
            text: AppLocalizations.of(context).journalHistory),
        const SizedBox(height: Styles.defaultSpacing),
        _buildButton(
            icon: UniconsLine.bookmark,
            text: AppLocalizations.of(context).savedArticle),
        const SizedBox(height: Styles.defaultSpacing),
        _buildButton(
            icon: UniconsLine.key_skeleton_alt,
            text: AppLocalizations.of(context).changePassword),
      ],
    );
  }

  Widget _buildHelpCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Styles.biggerSpacing),
        Text(AppLocalizations.of(context).helpCenter,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Styles.biggerSpacing),
        GestureDetector(
            onTap: () {
              AutoRouter.of(context).replace(const LoginRoute());
            },
            child: _buildButton(
                icon: UniconsLine.sign_out_alt,
                text: AppLocalizations.of(context).logout,
                borderColor: ColorValues.danger50)),
      ],
    );
  }

  Widget _buildButton(
      {required IconData icon, required String text, Color? borderColor}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
          border: Border.all(color: borderColor ?? ColorValues.grey10)),
      padding: const EdgeInsets.symmetric(
          vertical: Styles.contentPadding,
          horizontal: Styles.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
          const SizedBox(width: Styles.defaultSpacing),
          Expanded(
              child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: borderColor ?? ColorValues.text50),
          ))
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        RoundedButton(
            size: 64,
            border: Border.all(color: ColorValues.primary50),
            color: ColorValues.primary50,
            onTap: () {},
            child: Container()),
        const SizedBox(width: Styles.defaultSpacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fulan bin Fulan',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: Styles.smallerSpacing),
            Text(
              'fulan@gmail.com',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ColorValues.grey50),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Row(
        children: [
          RoundedButton(
              child: Image.asset(
            'assets/core/logo.png',
            width: 30,
          )),
          Expanded(
              child: Text(
            AppLocalizations.of(context).profile,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          )),
          RoundedButton(
              color: Colors.white,
              onTap: () {},
              child: const Icon(
                UniconsLine.setting,
                color: ColorValues.text50,
              )),
        ],
      ),
    );
  }
}
