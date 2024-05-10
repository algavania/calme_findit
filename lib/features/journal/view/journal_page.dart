import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/widgets/glowing_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/rounded_button.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
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
                    _buildMyJournalCardWidget(),
                    const SizedBox(height: Styles.defaultSpacing),
                    _buildJournalSectionWidget(),
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

  Widget _buildMyJournalCardWidget() {
    return Container(
      margin: const EdgeInsets.all(Styles.defaultPadding),
      decoration: BoxDecoration(
        color: ColorValues.primary30,
        borderRadius: BorderRadius.circular(Styles.biggerBorder),
        border: Border.all(color: ColorValues.primary40, width: 14),
      ),
      padding: const EdgeInsets.all(Styles.contentPadding),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).journalTitle1, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white
              ),),
              const SizedBox(height: Styles.smallerSpacing),
              Text('13 halaman', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white
              ),),
              const SizedBox(height: Styles.biggerSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    lineHeight: 20,
                    width: 40.w,
                    barRadius: const Radius.circular(Styles.defaultBorder),
                    percent: 3/13,
                    backgroundColor: Colors.white,
                    progressColor: ColorValues.secondary50,
                  ),
                  Text('3/13', style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white
                  ),),
                  const SizedBox(width: Styles.defaultSpacing),
                ],
              )
            ],
          )),
          const SizedBox(width: Styles.defaultSpacing),
          SvgPicture.asset('assets/people/journal_question.svg', width: 25.w,)
        ],
      ),
    );
  }

  Widget _buildJournalSectionWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).journalTopic,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: Styles.mediumSpacing),
          Text(
            AppLocalizations.of(context).journalText1,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: Styles.biggerSpacing),
          _buildJournalItemCardWidget(
            title: AppLocalizations.of(context).journalTitle1,
            subtitle: AppLocalizations.of(context).journalSubtitle1,
            imageUrl: 'assets/people/journal_question.svg'
          ),
          const SizedBox(height: Styles.defaultSpacing),
          _buildJournalItemCardWidget(
              title: AppLocalizations.of(context).journalTitle2,
              subtitle: AppLocalizations.of(context).journalSubtitle2,
              imageUrl: 'assets/people/meditation.svg'
          ),
          const SizedBox(height: Styles.smallerSpacing),
        ],
      ),
    );
  }

  Widget _buildJournalItemCardWidget(
      {required String title,
      required String subtitle,
      required String imageUrl}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
        border: Border.all(color: ColorValues.grey10),
      ),
      padding: const EdgeInsets.all(Styles.contentPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GlowingImageWidget(
            cardColor: Theme.of(context).primaryColor,
            imageUrl: imageUrl,
            imageSize: 8.w,
          ),
          const SizedBox(width: Styles.biggerSpacing),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: Styles.smallerSpacing,
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorValues.grey50),
              ),
            ],
          )),
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
        hint: AppLocalizations.of(context).findInterestingJournal,
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
            AppLocalizations.of(context).journal,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          )),
          RoundedButton(
              border: Border.all(color: ColorValues.secondary50),
              onTap: () {},
              child: const Icon(
                UniconsLine.history,
                color: ColorValues.secondary50,
              )),
        ],
      ),
    );
  }
}
