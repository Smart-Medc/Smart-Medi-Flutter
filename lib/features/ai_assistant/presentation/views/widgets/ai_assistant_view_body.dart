import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/ai_assistant/data/models/chat_message_model.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/widgets/ai_assistant_header.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/widgets/chat_input_bar.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/widgets/chat_messages_list.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/widgets/medical_disclaimer_card.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/widgets/medical_records_toggle.dart';

class AiAssistantViewBody extends StatefulWidget {
  const AiAssistantViewBody({super.key});

  @override
  State<AiAssistantViewBody> createState() => _AiAssistantViewBodyState();
}

class _AiAssistantViewBodyState extends State<AiAssistantViewBody> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  final List<ChatMessageModel> _messages = [];
  bool _useMedicalRecords = false;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _seedWelcomeMessage();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _seedWelcomeMessage() {
    _messages.add(
      ChatMessageModel(
        id: 'welcome',
        text: "Hello! I'm MedGemma, your AI health assistant. I'm here to "
            "answer your health-related questions. Remember, I provide "
            "information but not medical diagnosis. How can I assist you "
            "today?",
        sender: ChatSender.assistant,
        timestamp: DateTime.now(),
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _handleSend() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _isSending) return;

    setState(() {
      _messages.add(
        ChatMessageModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: text,
          sender: ChatSender.user,
          timestamp: DateTime.now(),
        ),
      );
      _isSending = true;
    });
    _messageController.clear();
    _scrollToBottom();

    try {
      // TODO(api): replace with the real call once the endpoint is ready, e.g:
      // final reply = await _aiAssistantRepo.sendMessage(
      //   text,
      //   useMedicalRecords: _useMedicalRecords,
      // );
      final reply = await _placeholderReply(text);

      if (!mounted) return;
      setState(() {
        _messages.add(reply);
        _isSending = false;
      });
      _scrollToBottom();
    } catch (_) {
      if (!mounted) return;
      setState(() => _isSending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
        ),
      );
    }
  }

  /// Temporary local reply so the UI is fully functional before the backend
  /// endpoint exists. Swap this out for the repo call above.
  Future<ChatMessageModel> _placeholderReply(String userText) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return ChatMessageModel(
      id: '${DateTime.now().microsecondsSinceEpoch}_reply',
      text: "This is a placeholder response. Once the AI Assistant endpoint "
          "is connected, real answers will appear here.",
      sender: ChatSender.assistant,
      timestamp: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    const SliverToBoxAdapter(child: CustomAppBar()),
                    const SliverToBoxAdapter(child: AiAssistantHeader()),
                    SliverToBoxAdapter(child: 16.verticalSpace),
                    const SliverToBoxAdapter(child: MedicalDisclaimerCard()),
                    SliverToBoxAdapter(child: 16.verticalSpace),
                    SliverToBoxAdapter(
                      child: MedicalRecordsToggle(
                        value: _useMedicalRecords,
                        onChanged: (value) {
                          setState(() => _useMedicalRecords = value);
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: 16.verticalSpace),
                    ChatMessagesList(
                      messages: _messages,
                      isSending: _isSending,
                    ),
                    SliverToBoxAdapter(child: 16.verticalSpace),
                  ],
                ),
              ),
            ],
          ),
        ),
        ChatInputBar(
          controller: _messageController,
          enabled: !_isSending,
          onSend: _handleSend,
        ),
      ],
    );
  }
}