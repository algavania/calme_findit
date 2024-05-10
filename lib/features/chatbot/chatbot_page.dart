import 'package:calme/core/color_values.dart';
import 'package:calme/core/ui_constant.dart';
import 'package:calme/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:unicons/unicons.dart';

import '../../../l10n/l10n.dart';
import '../../widgets/back_button.dart';
import '../../widgets/rounded_button.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _chatController = TextEditingController();
  final List<MessageModel> _list = [];
  
  @override
  void initState() {
    _list.addAll([
      MessageModel(message: 'Hai'),
      MessageModel(message: 'Halo, apa kabar hari  ini?', isSender: false),
      MessageModel(message: 'Hmm, baik hari ini, cuman abis kena bully, aku harus ngapain?'),
      MessageModel(message: 'Saya tidak berpikir menilai orang itu baik untuk dilakukan, tetapi saya pikir semua orang menilai secara internal.', isSender: false),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: UiConstant.defaultSpacing),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerRight,
                        fit: BoxFit.cover,
                        image: svg_provider.Svg(
                          'assets/home/chat_bg.svg',
                          size: Size(100.w, 100.h)
                        )
                      ),
                      color: Colors.white,
                      border: const Border(
                        top: BorderSide(color: ColorValues.grey10),
                        bottom: BorderSide(color: ColorValues.grey10),
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildBody(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: UiConstant.defaultSpacing),
              MessageChatBoxWidget(controller: _chatController, onSend: () {
                setState(() {
                  _list.add(MessageModel(message: _chatController.text));
                  _chatController.clear();
                });
              },),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: UiConstant.defaultSpacing),
      itemCount: _list.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: UiConstant.defaultPadding),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        MessageModel chat = _list[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: UiConstant.defaultPadding),
          child: Align(
            alignment: (!chat.isSender ? Alignment.topLeft : Alignment.topRight),
            child: Container(
              decoration: BoxDecoration(
                border: chat.isSender ? null : Border.all(color: ColorValues.grey10),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(!chat.isSender ? UiConstant.smallBorder : UiConstant.defaultBorder),
                  topRight: Radius.circular(chat.isSender ? UiConstant.smallBorder : UiConstant.defaultBorder),
                  bottomRight: const Radius.circular(UiConstant.defaultBorder),
                  bottomLeft: const Radius.circular(UiConstant.defaultBorder),
                ),
                color: (!chat.isSender ? ColorValues.background : Theme.of(context).primaryColor),
              ),
              padding: const EdgeInsets.symmetric(vertical: UiConstant.contentPadding, horizontal: UiConstant.defaultPadding),
              margin: EdgeInsets.only(
                left: !chat.isSender ? 0 : 10.w,
                right: chat.isSender ? 0 : 10.w
              ),
              child: Text(chat.message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: chat.isSender ? Colors.white : Colors.black
              ),),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(UiConstant.defaultPadding),
      child: Row(
        children: [
          const CustomBackButton(),
          const SizedBox(width: UiConstant.defaultPadding),
          Expanded(
              child: Row(
            children: [
              RoundedButton(
                withOnlineIndicator: true,
                color: ColorValues.secondary10,
                border: Border.all(color: ColorValues.secondary20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset('assets/home/chatbot.svg'),
                ),
              ),
              const SizedBox(width: UiConstant.defaultSpacing),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).calmebot,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    AppLocalizations.of(context).online,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ColorValues.grey50),
                  ),
                ],
              )
            ],
          )),
          const SizedBox(width: UiConstant.defaultPadding),
          const RoundedButton(
            color: Colors.transparent,
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class MessageChatBoxWidget extends StatefulWidget {
  const MessageChatBoxWidget({Key? key, required this.controller, this.onSend}) : super(key: key);
  final TextEditingController controller;
  final void Function()? onSend;

  @override
  State<MessageChatBoxWidget> createState() => _MessageChatBoxWidgetState();
}

class _MessageChatBoxWidgetState extends State<MessageChatBoxWidget> {
  bool _isSend = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: ColorValues.grey10))),
      padding: const EdgeInsets.all(UiConstant.defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: widget.controller,
              isDense: true,
              onChanged: (s) {
                setState(() {
                  _isSend = s?.trim().isNotEmpty ?? false;
                });
              },
              hint: AppLocalizations.of(context).typeSomething,
            ),
          ),
          const SizedBox(width: UiConstant.defaultSpacing),
          RoundedButton(
              onTap: !_isSend ? null : widget.onSend,
              color: _isSend ? Theme.of(context).primaryColor : ColorValues.grey10,
              child: Icon(
                _isSend ? UniconsLine.location_arrow_alt : UniconsLine.navigator,
                color: _isSend ? Colors.white : ColorValues.grey30,
              ))
        ],
      ),
    );
  }
}

class MessageModel {
  final String message;
  final bool isSender;

  MessageModel({required this.message, this.isSender = true});
}

