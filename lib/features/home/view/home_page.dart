import 'package:auto_route/auto_route.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/data/models/meditation/meditation_model.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/routes/router.gr.dart';
import 'package:calme/widgets/custom_app_bar.dart';
import 'package:calme/widgets/custom_button.dart';
import 'package:calme/widgets/custom_text_field.dart';
import 'package:calme/widgets/glowing_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/article_card_widget.dart';
import '../../../../widgets/meditation_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).home,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDayIntroductionSectionWidget(),
              const SizedBox(height: Styles.defaultSpacing),
              _buildMeditationSectionWidget(),
              const SizedBox(height: Styles.defaultSpacing),
              _buildOtherMeditationSectionWidget(),
              const SizedBox(height: Styles.defaultSpacing),
              _buildBreathingExerciseSectionWidget(),
              const SizedBox(height: Styles.defaultSpacing),
              _buildArticleSectionWidget(),
              const SizedBox(height: Styles.defaultSpacing),
              _buildCopingToolboxWidget(),
              const SizedBox(height: Styles.defaultSpacing),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCopingToolboxWidget() {
    Color color = Theme.of(context).primaryColor;
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Row(
        children: [
          GlowingImageWidget(cardColor: color, imageUrl: 'assets/home/gift.svg',),
          const SizedBox(width: Styles.defaultSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).copingToolbox,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: Styles.defaultSpacing,),
                Text(AppLocalizations.of(context).copingText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: Styles.defaultSpacing),
          InkWell(
            onTap: () {
              AutoRouter.of(context).navigate(const CopingRoute());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ColorValues.lighten(color, 20),
                  borderRadius: BorderRadius.circular(Styles.smallerBorder)
              ),
              padding: const EdgeInsets.all(Styles.smallerSpacing),
              child: const Icon(
                UniconsSolid.angle_right_b,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildArticleSectionWidget() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).articleSectionText1,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              SizedBox(width: 1.w),
              Text(
                AppLocalizations.of(context).viewAll,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: ColorValues.secondary50),
              )
            ],
          ),
          const SizedBox(height: Styles.mediumSpacing),
          Text(
            AppLocalizations.of(context).articleSectionText2,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: Styles.biggerSpacing),
          const ArticleCardWidget(),
          const SizedBox(height: Styles.smallerSpacing),
        ],
      ),
    );
  }

  Widget _buildBreathingExerciseSectionWidget() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/home/breathing_bg.png')
        )
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: Styles.biggerPadding, horizontal: Styles.defaultPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).breathingExercise,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: Styles.defaultSpacing),
                Text(
                  AppLocalizations.of(context).breathingExerciseText,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          Flexible(child: Container()),
          Flexible(
            flex: 3,
            child: CustomButton(
              buttonText: AppLocalizations.of(context).start,
              prefixIcon: UniconsLine.play,
              onPressed: () {

              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOtherMeditationSectionWidget() {
    final dummyModel = generateMockMeditationModel();
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).otherMeditation,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              SizedBox(width: 1.w),
              Text(
                AppLocalizations.of(context).viewAll,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: ColorValues.secondary50),
              )
            ],
          ),
          const SizedBox(height: Styles.mediumSpacing),
          Text(
            AppLocalizations.of(context).viewPlaylistText,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: Styles.biggerSpacing),
          MeditationCardWidget(meditationModel: dummyModel,),
          const SizedBox(height: Styles.smallerSpacing),
          MeditationCardWidget(meditationModel: dummyModel),
          const SizedBox(height: Styles.smallerSpacing),
          MeditationCardWidget(meditationModel: dummyModel),
        ],
      ),
    );
  }

  Widget _buildMeditationSectionWidget() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).meditationSectionText1,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: Styles.mediumSpacing),
          Text(
            AppLocalizations.of(context).meditationSectionText2,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: Styles.biggerSpacing),
          MeditationCardWidget(meditationModel: generateMockMeditationModel(),)
        ],
      ),
    );
  }

  Widget _buildDayIntroductionSectionWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              alignment: Alignment.topRight,
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'assets/home/intro_bg.png',
              ))),
      child: Container(
        padding: const EdgeInsets.all(Styles.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).howIsYourDay,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).introductionDayText1,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorValues.grey50),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                    flex: 4,
                    child: CustomButton(
                      fontSize: 16,
                      buttonText: AppLocalizations.of(context)
                          .introductionDayButtonText,
                      onPressed: () {
                        AutoRouter.of(context).navigate(const ChatbotRoute());
                      },
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSearchWidget() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            controller: _searchController,
            hint: AppLocalizations.of(context).findSomething,
            icon: UniconsLine.search,
            isDense: true,
          )),
          const SizedBox(width: Styles.defaultPadding),
          Container(
            height: 7.h,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Styles.defaultBorder),
                border: Border.all(color: ColorValues.primary10),
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
