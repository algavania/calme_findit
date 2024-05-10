import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/core/styles.dart';
import 'package:calme/data/models/journal/journal_model.dart';
import 'package:calme/features/journal/bloc/journal_bloc.dart';
import 'package:calme/features/journal/data/repository/journal_repository.dart';
import 'package:calme/injector/injector.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/routes/router.gr.dart';
import 'package:calme/util/extensions.dart';
import 'package:calme/widgets/custom_app_bar.dart';
import 'package:calme/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

class JournalStartPage extends StatefulWidget {
  const JournalStartPage({super.key, required this.journalModel});

  final JournalModel journalModel;

  @override
  State<JournalStartPage> createState() => _JournalStartPageState();
}

class _JournalStartPageState extends State<JournalStartPage> {
  final _bloc = JournalBloc(repository: Injector.instance<JournalRepository>());

  @override
  Widget build(BuildContext context) {
    return BlocListener<JournalBloc, JournalState>(
      bloc: _bloc,
      listener: (context, state) {
        state.maybeMap(
            loading: (_) {
              context.loaderOverlay.show();
            },
            questionsLoaded: (s) {
              context.loaderOverlay.hide();
              AutoRouter.of(context).push(JournalDetailRoute(
                  answers: s.answers,
                  questions: s.list,
                  journalModel: widget.journalModel));
            },
            error: (s) {
              context.loaderOverlay.hide();
              context.showSnackBar(message: s.error, isSuccess: false);
            },
            orElse: () {});
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.journalModel.title,
        ),
        body: Container(
          width: 100.w,
          height: 100.h,
          padding: const EdgeInsets.all(Styles.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.journalModel.thumbnailUrl,
                height: 40.h,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: Styles.bigSpacing,
              ),
              Text(
                widget.journalModel.headline,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Styles.mediumSpacing,
              ),
              Text(
                widget.journalModel.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ColorValues.grey50),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    buttonText: 'Kembali',
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    isWhiteButton: true,
                  )),
                  const SizedBox(
                    width: Styles.defaultSpacing,
                  ),
                  Expanded(
                      child: CustomButton(
                    buttonText: AppLocalizations.of(context).next,
                    onPressed: () {
                      _bloc.add(JournalEvent.getJournalQuestions(
                          widget.journalModel.id!));
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: Styles.defaultSpacing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
