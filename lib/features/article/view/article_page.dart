import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/data/models/article/article_model.dart';
import 'package:calme/features/article/bloc/article_bloc.dart';
import 'package:calme/features/article/data/article_repository.dart';
import 'package:calme/injector/injector.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/article_card_widget.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/rounded_button.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final TextEditingController _searchController = TextEditingController();
  final _bloc = ArticleBloc(repository: Injector.instance<ArticleRepository>());

  @override
  void initState() {
    _bloc.add(const ArticleEvent.getArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).article
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // _buildTopSearchWidget(),
                // const SizedBox(height: Styles.defaultSpacing),
                _buildArticleSectionWidget(),
                const SizedBox(height: Styles.defaultSpacing),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _buildArticleSectionWidget() {
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
                      .articleSectionText1,
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
                .articleSectionText2,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
          ),
          const SizedBox(height: Styles.biggerSpacing),
          BlocBuilder<ArticleBloc, ArticleState>(
            bloc: _bloc,
            builder: (context, state) {
              final list = List.generate(5, (_) => generateMockArticleModel());
              return state.maybeMap(
                  loaded: (s) => _buildList(s.list, false),
                  orElse: () => _buildList(list, true));
            },
          ),
          const SizedBox(height: Styles.smallerSpacing),
        ],
      ),
    );
  }

  Widget _buildList(List<ArticleModel> list, bool isLoading) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, i) => ArticleCardWidget(articleModel: list[i],),
        separatorBuilder: (_, __) =>
        const SizedBox(height: Styles.biggerSpacing,),
        itemCount: list.length);
  }

  Widget _buildTopSearchWidget() {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
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
}