import 'package:auto_route/auto_route.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/data/models/meditation/meditation_model.dart';
import 'package:calme/data/models/meditation/session_model.dart';
import 'package:calme/features/meditation/bloc/meditation_bloc.dart';
import 'package:calme/features/meditation/data/repository/meditation_repository.dart';
import 'package:calme/injector/injector.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/routes/router.gr.dart';
import 'package:calme/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/meditation_card_widget.dart';
import '../../../../widgets/rounded_button.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final TextEditingController _searchController = TextEditingController();
  final _bloc =
      MeditationBloc(repository: Injector.instance<MeditationRepository>());
  final _dummyList = <MeditationModel>[];

  @override
  void initState() {
    _bloc.add(const MeditationEvent.getAllMeditations());
    final dummySession = generateMockSessionModel();
    _dummyList.addAll(List.generate(5, (index) {
      var model = generateMockMeditationModel();
      model =
          model.copyWith(sessions: [dummySession, dummySession, dummySession]);
      return model;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).meditation,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            const SizedBox(height: Styles.defaultSpacing),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMeditationSectionWidget(),
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

  Widget _buildMeditationSectionWidget() {
    List<Color> colors = [
      ColorValues.primary50,
      ColorValues.pink50,
      ColorValues.secondary50,
    ];
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
                  AppLocalizations.of(context).meditationTopic,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
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
          BlocBuilder<MeditationBloc, MeditationState>(
            bloc: _bloc,
            builder: (context, state) {
              return state.maybeMap(
                  loaded: (s) => _buildList(s.list, false),
                  orElse: () => _buildList(_dummyList, true));
            },
          ),
          const SizedBox(height: Styles.smallerSpacing),
        ],
      ),
    );
  }

  Widget _buildList(List<MeditationModel> list, bool isLoading) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  AutoRouter.of(context)
                      .push(MeditationDetailRoute(meditationModel: list[i]));
                },
                child: MeditationCardWidget(
                  meditationModel: list[i],
                ),
              ),
          separatorBuilder: (_, __) => const SizedBox(
                height: Styles.biggerSpacing,
              ),
          itemCount: list.length),
    );
  }

  Widget _buildTopSearchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: CustomTextField(
        controller: _searchController,
        hint: AppLocalizations.of(context).findMeditationTopic,
        icon: UniconsLine.search,
        isDense: true,
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Row(
        children: [
          RoundedButton(
              child: Image.asset(
            'assets/core/logo.png',
            width: 30,
          )),
          Expanded(
              child: Text(
            AppLocalizations.of(context).meditation,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          )),
          RoundedButton(
              border: Border.all(color: ColorValues.primary50),
              color: ColorValues.primary50,
              onTap: () {},
              child: Container()),
        ],
      ),
    );
  }
}
