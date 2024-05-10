import 'package:calme/core/color_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../core/styles.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/rounded_button.dart';

class DetailArticlePage extends StatefulWidget {
  const DetailArticlePage({Key? key}) : super(key: key);

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: Styles.defaultPadding),
            _buildAppBar(),
            const SizedBox(height: Styles.defaultSpacing),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: Styles.defaultSpacing),
                  _buildWriterSectionWidget(),
                  const SizedBox(height: Styles.defaultSpacing),
                  _buildArticleBody(),
                  const SizedBox(height: Styles.defaultSpacing),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleBody() {
    String title = 'Mengenal Poetry Therapy, Puisi Untuk Sehat Mental';
    String body = 'Poetry Therapy adalah praktik menggunakan puisi sebagai sarana untuk meningkatkan kesehatan mental dan emotional seseorang. Melalui ekspresi kreatif, puisi dapat menjadi alat yang efektif dalam mengatasi stres dan meningkatkan kesejahteraan mental.\n\nDalam Poetry Therapy, individu dapat mengeksplorasi dan mengungkapkan perasaan, pengalaman, dan pemikiran mereka melalui proses menulis puisi. Aktivitas ini membantu mereka memahami dan merespons emosi dengan lebih baik, mempromosikan pemulihan, dan membantu mengurangi gejala kecemasan dan depresi. Poetry Therapy juga dapat digunakan sebagai alat pengembangan diri, membangun kepercayaan diri, dan merangsang kreativitas serta refleksi diri.';
    return Padding(
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: Styles.defaultSpacing,),
          SizedBox(
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(Styles.defaultBorder),
                  child: Image.asset('assets/home/article_placeholder.png', width: MediaQuery.of(context).size.width, fit: BoxFit.cover,))),
          const SizedBox(height: Styles.defaultSpacing,),
          Text(body, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorValues.grey50
          )),
        ],
      ),
    );
  }

  Widget _buildWriterSectionWidget() {
    return Row(
      children: [
        const SizedBox(width: Styles.defaultPadding),
        RoundedButton(
            color: ColorValues.primary10,
            border: Border.all(color: ColorValues.primary20),
            child: Container()),
        const SizedBox(width: Styles.defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).writer,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorValues.grey50
                ),
              ),
              SizedBox(height: 0.5.h),
              Text('Admin', style: Theme.of(context).textTheme.labelLarge,)
            ],
          ),
        ),
        const SizedBox(width: Styles.defaultPadding),
        RoundedButton(
            border: Border.all(color: ColorValues.grey10),
            child: const Icon(UniconsLine.share_alt, color: ColorValues.grey50)),
        const SizedBox(width: Styles.defaultPadding),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Row(
        children: [
          const CustomBackButton(),
          Expanded(
              child: Text(
                AppLocalizations
                    .of(context)
                    .readArticle,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              )),
          const RoundedButton(color: Colors.transparent,child: SizedBox.shrink(),),
        ],
      ),
    );
  }
}
