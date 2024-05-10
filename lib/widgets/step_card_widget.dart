import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:unicons/unicons.dart';

import '../core/color_values.dart';
import '../core/styles.dart';

class StepCardWidget extends StatelessWidget {
  const StepCardWidget({
    super.key, required this.imageUrl, this.isFirst = false, this.isLast = false, this.isActive = false, this.isNextDisabled = false
  });

  final String imageUrl;
  final bool isFirst, isLast, isActive, isNextDisabled;

  @override
  Widget build(BuildContext context) {
    BorderSide border = const BorderSide(
        color: ColorValues.grey10,
        width: 1
    );

    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 35,
        height: 35,
        indicator: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? ColorValues.success40 : Colors.white,
              border: isActive ? null : Border.all(
                  color: ColorValues.grey10,
                  width: 2
              )
          ),
          child: Center(
            child: Icon(
              isActive ? UniconsSolid.check : UniconsLine.lock,
              color: isActive ? Colors.white : ColorValues.grey10,
            ),
          ),
        ),
        padding: const EdgeInsets.all(6),
      ),
      endChild: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(Styles.defaultPadding),
            margin: const EdgeInsets.only(left: 5, bottom: Styles.defaultSpacing),
            decoration: BoxDecoration(
                color: isActive ? ColorValues.success10 : Colors.white,
                borderRadius: BorderRadius.circular(Styles.defaultBorder),
                border: Border(
                    top: const BorderSide(
                      color: ColorValues.grey10,
                      width: 5,
                    ),
                    left: border,
                    right: border,
                    bottom: border
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tenang di Rumah', style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: 1.h),
                RichText(text: TextSpan(
                    text: 'Sesi 1/3   •   ',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: ColorValues.grey50
                    ),
                    children: [
                      TextSpan(
                          text: '5 menit',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ColorValues.grey50
                          )
                      )
                    ]
                )),
                SizedBox(height: 0.5.h),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(imageUrl, width: 20.w,)),
        ],
      ),
      beforeLineStyle: LineStyle(
          color: isActive ? ColorValues.success40 : ColorValues.grey10,
          thickness: 2
      ),
      afterLineStyle: LineStyle(
          color: !isNextDisabled ? ColorValues.success40 : ColorValues.grey10,
          thickness: 2
      ),
    );
  }
}