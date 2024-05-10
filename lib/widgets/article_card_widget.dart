import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calme/data/models/article/article_model.dart';
import 'package:calme/routes/router.gr.dart';
import 'package:calme/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/color_values.dart';
import '../core/styles.dart';

class ArticleCardWidget extends StatefulWidget {
  const ArticleCardWidget({Key? key, required this.articleModel})
      : super(key: key);
  final ArticleModel articleModel;

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
            padding: const EdgeInsets.all(Styles.defaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: ColorValues.grey10),
                borderRadius: BorderRadius.circular(Styles.defaultBorder)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Styles.defaultBorder),
                  child: CachedNetworkImage(
                    imageUrl: widget.articleModel.thumbnailUrl,
                    width: 18.w,
                    height: 15.h,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: Styles.defaultSpacing),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.articleModel.title,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: _isBookmarked
                                    ? Theme.of(context).primaryColor
                                    : null,
                                decoration: _isBookmarked
                                    ? TextDecoration.underline
                                    : null),
                      ),
                      SizedBox(height: 1.h),
                      Expanded(child: Container()),
                      Flexible(
                        child: Text(
                          '${widget.articleModel.author}  •  ${widget.articleModel.createdAt.toFormattedDate()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: ColorValues.grey50,
                                  overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: InkWell(
        //     onTap: () {
        //       setState(() {
        //         _isBookmarked = !_isBookmarked;
        //       });
        //     },
        //     child: Container(
        //       padding: const EdgeInsets.all(6),
        //       decoration: BoxDecoration(
        //         color: _isBookmarked ? ColorValues.secondary50 : Colors.white,
        //         border: Border.all(color: ColorValues.grey10),
        //         borderRadius: const BorderRadius.only(
        //           bottomLeft: Radius.circular(Styles.defaultBorder),
        //           topRight: Radius.circular(Styles.defaultBorder),
        //         )
        //       ),
        //       child: Icon(UniconsLine.bookmark, size: 20,
        //         color: _isBookmarked ? Colors.white : ColorValues.grey10,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
