import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/meditation_card_widget.dart';
import '../../../../widgets/rounded_button.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final TextEditingController _searchController = TextEditingController();

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
                    _buildTopSearchWidget(),
                    const SizedBox(height: Styles.defaultSpacing),
                    _buildMeditationSectionWidget(),
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

  Widget _buildMeditationSectionWidget() {
    List<Color> colors = [
      ColorValues.primary50,
      ColorValues.pink50,
      ColorValues.secondary50,
    ];
    return Container(
      color: Colors.white,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations
                      .of(context)
                      .meditationTopic,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: Styles.mediumSpacing),
          Text(
            AppLocalizations
                .of(context)
                .viewPlaylistText,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: Styles.biggerSpacing),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, i) => MeditationCardWidget(cardColor: colors[i],),
              separatorBuilder: (_, __) =>
              const SizedBox(height: Styles.biggerSpacing,),
              itemCount: 3),
          const SizedBox(height: Styles.smallerSpacing),
        ],
      ),
    );
  }

  Widget _buildTopSearchWidget() {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: CustomTextField(
        controller: _searchController,
        hint: AppLocalizations
            .of(context)
            .findMeditationTopic,
        icon: UniconsLine.search,
        isDense: true,
      ),
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
                AppLocalizations
                    .of(context)
                    .meditation,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              )),
          RoundedButton(
              border: Border.all(color: ColorValues.primary50),
              color: ColorValues.primary50,
              onTap: () {},
              child: Container()),
        ],
      ),
    );
  }
}