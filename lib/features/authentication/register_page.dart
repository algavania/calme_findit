import 'package:auto_route/auto_route.dart';
import 'package:calme/core/color_values.dart';
import 'package:calme/core/ui_constant.dart';
import 'package:calme/l10n/l10n.dart';
import 'package:calme/widgets/custom_button.dart';
import 'package:calme/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../../routes/router.gr.dart';
import '../../widgets/logo_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: const EdgeInsets.all(UiConstant.defaultPadding),
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        const LogoWidget(),
                        SizedBox(height: 6.h),
                        Text(
                          AppLocalizations.of(context).registerText1,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 1.5.h),
                        Text(
                          AppLocalizations.of(context).registerText2,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: ColorValues.grey50),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextField(
                          controller: _nameController,
                          label: AppLocalizations.of(context).yourName,
                          hint: AppLocalizations.of(context).enterName,
                          icon: UniconsLine.user,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _emailController,
                          label: AppLocalizations.of(context).yourEmail,
                          hint: AppLocalizations.of(context).enterEmail,
                          icon: UniconsLine.envelope,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _passwordController,
                          label: AppLocalizations.of(context).yourPassword,
                          hint: AppLocalizations.of(context).enterPassword,
                          icon: UniconsLine.key_skeleton,
                          isPassword: true,
                        ),
                        const SizedBox(height: 26),
                        CustomButton(
                          buttonText: AppLocalizations.of(context).register,
                          onPressed: () {},
                        ),
                        Expanded(child: Container()),
                        SizedBox(height: 3.h),
                        RichText(
                            text: TextSpan(
                                text: AppLocalizations.of(context).registerSubText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: ColorValues.grey50),
                                children: [
                                  TextSpan(
                                      text:
                                      ' ${AppLocalizations.of(context).registerSubText2}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          AutoRouter.of(context).replace(const LoginRoute());
                                        })
                                ])),
                        SizedBox(height: 3.h)
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
