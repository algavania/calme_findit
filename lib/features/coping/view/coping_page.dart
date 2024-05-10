import 'package:cached_network_image/cached_network_image.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/data/models/coping/coding_model.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/widgets/custom_button.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:sizer/sizer.dart';

class CopingPage extends StatefulWidget {
  const CopingPage({super.key});

  @override
  State<CopingPage> createState() => _CopingPageState();
}

class _CopingPageState extends State<CopingPage> {
  final ValueNotifier<int> _slideCount = ValueNotifier(1);
  List<CopingModel> _copingSkills = [];

  @override
  void initState() {
    _copingSkills = [
      CopingModel(title: 'Coping Skill 1', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 2', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 3', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 4', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 5', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 6', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 7', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 8', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 9', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now()),
      CopingModel(title: 'Coping Skill 10', description: 'Melakukan teknik pernapasan  atau meditasi untuk menenangkan pikiran dan tubuh.', thumbnailUrl: 'https://firebasestorage.googleapis.com/v0/b/calme-64dbe.appspot.com/o/copings%2FAvw3jPkxd50RmJjvaxVl%2Fthumbnail.png?alt=media&token=7561a195-9ba4-49f2-b1ca-5b87484b00e7', createdAt: DateTime.now())
    ];
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).copingSkillsToolbox,
          style: const TextStyle(color: ColorValues.white),
        ),
        backgroundColor: ColorValues.primary50,
        iconTheme: const IconThemeData(color: ColorValues.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Styles.extraLargePadding, horizontal: Styles.defaultPadding),
        child: Column(
          children: [
            _buildSwipeCards(),
            const Spacer(),
            _buildBottomButton(),
          ],
        ),
      ),
      backgroundColor: ColorValues.primary50,
    );
  }

  Widget _buildSwipeCards() {
    return Column(
      children: [
        SizedBox(
          height: 56.h,
          child: CardSwiper(
            onSwipe: (int _, int? __, CardSwiperDirection ___) {
              _slideCount.value < _copingSkills.length ? _slideCount.value++ : _slideCount.value = 1;
              return true;
            },
            cardsCount: _copingSkills.length,
            cardBuilder: (context, index, _, __) {
              return _buildCopingCard(_copingSkills[index]);
            },
          ),
        ),
        const SizedBox(height: Styles.biggerSpacing),
        ValueListenableBuilder(
          valueListenable: _slideCount,
          builder: (context, _, __) {
            return Text(
              '${AppLocalizations.of(context).slide} ${_slideCount.value}/${_copingSkills.length}',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: ColorValues.white),
            );
          }
        )
      ],
    );
  }

  Widget _buildCopingCard(CopingModel copingModel) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorValues.primary40,
        borderRadius: BorderRadius.circular(Styles.biggerBorder),
        boxShadow: [
          BoxShadow(
            color: ColorValues.white.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Styles.biggerBorder),
            child: Image.asset(
              'assets/coping/background.png',
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Styles.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: copingModel.thumbnailUrl,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: Styles.bigSpacing),
                Text(
                  copingModel.title,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorValues.white),
                ),
                const SizedBox(height: Styles.mediumSpacing),
                Text(
                  copingModel.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorValues.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return CustomButton(
      onPressed: () {
      },
      buttonText: AppLocalizations.of(context).next,
      backgroundColor: ColorValues.primary40,
    );
  }
}
