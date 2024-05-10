import 'package:auto_route/auto_route.dart';
import 'package:calme/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../core/color_values.dart';
import '../core/ui_constant.dart';

class ArticleCardWidget extends StatefulWidget {
  const ArticleCardWidget({Key? key}) : super(key: key);

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  bool _isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).navigate(const DetailArticleRoute());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 15.h,
            padding: const EdgeInsets.all(UiConstant.defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorValues.grey10),
              borderRadius: BorderRadius.circular(UiConstant.defaultBorder)
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(UiConstant.defaultBorder),
                  child: Container(
                    width: 18.w,
                    color: ColorValues.primary50,
                  ),
                ),
                const SizedBox(width: UiConstant.defaultSpacing),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mengenal Poetry Therapy, Puisi Untuk Sehat Mental',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: _isBookmarked ? Theme.of(context).primaryColor : null,
                          decoration: _isBookmarked ? TextDecoration.underline : null
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Expanded(child: Container()),
                      Flexible(
                        child: Text('Admin  •  5 menit  •  21/06/2023',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorValues.grey50, overflow: TextOverflow.ellipsis
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              setState(() {
                _isBookmarked = !_isBookmarked;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _isBookmarked ? ColorValues.secondary50 : Colors.white,
                border: Border.all(color: ColorValues.grey10),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(UiConstant.defaultBorder),
                  topRight: Radius.circular(UiConstant.defaultBorder),
                )
              ),
              child: Icon(UniconsLine.bookmark, size: 20,
                color: _isBookmarked ? Colors.white : ColorValues.grey10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
