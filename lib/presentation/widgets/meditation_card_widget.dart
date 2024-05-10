import 'package:calme/presentation/widgets/glowing_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../core/color_values.dart';
import '../core/ui_constant.dart';
import 'step_card_widget.dart';

class MeditationCardWidget extends StatefulWidget {
  const MeditationCardWidget({
    super.key, this.cardColor = ColorValues.secondary50, this.imageUrl = 'assets/home/stay_home.svg',
  });
  final Color cardColor;
  final String imageUrl;

  @override
  State<MeditationCardWidget> createState() => _MeditationCardWidgetState();
}

class _MeditationCardWidgetState extends State<MeditationCardWidget> {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: widget.cardColor,
              borderRadius: BorderRadius.circular(UiConstant.defaultBorder)),
          padding: const EdgeInsets.all(UiConstant.defaultPadding),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              GlowingImageWidget(imageUrl: widget.imageUrl, cardColor: widget.cardColor),
              const SizedBox(width: UiConstant.defaultSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Tenang di Rumah',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.white),
                            children: [
                              const TextSpan(text: '    •    '),
                              TextSpan(
                                  text: '3 sesi',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white))
                            ])),
                    const SizedBox(height: UiConstant.smallerSpacing),
                    Text('Menenangkan pikiran di rumah',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white))
                  ],
                ),
              ),
              const SizedBox(width: UiConstant.defaultSpacing),
              InkWell(
                onTap: () {
                  setState(() {
                    _isOpened = !_isOpened;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorValues.lighten(widget.cardColor, 20),
                      borderRadius: BorderRadius.circular(UiConstant.smallerBorder)
                  ),
                  padding: const EdgeInsets.all(UiConstant.smallerSpacing),
                  child: Icon(
                    _isOpened ? UniconsSolid.angle_up : UniconsSolid.angle_down,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h),
        if (_isOpened) const Column(
          children: [
            StepCardWidget(imageUrl: 'assets/people/listening1.svg', isFirst: true, isActive: true, isNextDisabled: true),
            StepCardWidget(imageUrl: 'assets/people/listening2.svg', isActive: false, isNextDisabled: true),
            StepCardWidget(imageUrl: 'assets/people/dumbbell.svg', isLast: true, isActive: false),
          ],
        )
      ],
    );
  }
}