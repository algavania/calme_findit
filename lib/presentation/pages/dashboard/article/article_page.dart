import 'package:calme/l10n/l10n.dart';
import 'package:calme/presentation/core/color_values.dart';
import 'package:calme/presentation/core/ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../widgets/article_card_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/rounded_button.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
            const SizedBox(height: UiConstant.defaultPadding),
            _buildAppBar(),
            const SizedBox(height: UiConstant.defaultSpacing),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTopSearchWidget(),
                    const SizedBox(height: UiConstant.defaultSpacing),
                    _buildArticleSectionWidget(),
                    const SizedBox(height: UiConstant.defaultSpacing),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleSectionWidget() {
    return Container(
      color: Colors.white,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.all(UiConstant.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations
                      .of(context)
                      .articleSectionText1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: UiConstant.mediumSpacing),
          Text(
            AppLocalizations
                .of(context)
                .articleSectionText2,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: UiConstant.biggerSpacing),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, __) => const ArticleCardWidget(),
              separatorBuilder: (_, __) =>
              const SizedBox(height: UiConstant.biggerSpacing,),
              itemCount: 1),
          const SizedBox(height: UiConstant.smallerSpacing),
        ],
      ),
    );
  }

  Widget _buildTopSearchWidget() {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: UiConstant.defaultPadding),
      child: CustomTextField(
        controller: _searchController,
        hint: AppLocalizations
            .of(context)
            .findInterestingArticle,
        icon: UniconsLine.search,
        isDense: true,
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: UiConstant.defaultPadding),
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
                    .article,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              )),
          RoundedButton(
              border: Border.all(color: ColorValues.secondary50),
              onTap: () {},
              child: const Icon(
                UniconsLine.bookmark,
                color: ColorValues.secondary50,
              )),
        ],
      ),
    );
  }
}