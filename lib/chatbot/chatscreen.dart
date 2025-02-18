import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/services.dart';
import 'package:online_cource_app/chatbot/message.dart';
import 'package:online_cource_app/chatbot/messages.dart';
import 'package:online_cource_app/chatbot/size.dart';
import 'package:online_cource_app/chatbot/style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userMessage = TextEditingController();
  bool isLoading = false;
  static const apiKey = "AIzaSyAVxEAtuoQ32vaXXJIipDPRCk8qwEUrgWU";
  final List<Message> _messages = [];
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  void sendMessage() async {
    final userMessage = _userMessage.text;
    _userMessage.clear();

    setState(() {
      _messages.add(Message(
        isUser: true,
        message: userMessage,
        date: DateTime.now(),
      ));
      isLoading = true;
    });

    final prompt =
        "You are Feminee, a chatbot helping marginalized women with skill-based training, digital literacy, and support. Be warm, encouraging, and resourceful. User asks: $userMessage";

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
        isUser: false,
        message: response.text ??
            "I’m here to help. Could you rephrase your question?",
        date: DateTime.now(),
      ));
      isLoading = false;
    });
  }

  void copyToClipboard(String code) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Response copied to clipboard")));
  }

  void onAnimatedTextFinished() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: resChat),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Feminee Chatbot',
            style: GoogleFonts.poppins(
                color: resChat, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                  onAnimatedTextFinished: onAnimatedTextFinished,
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: medium, vertical: small),
            child: TextFormField(
              maxLines: 6,
              minLines: 1,
              controller: _userMessage,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(medium, 0, small, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(xlarge),
                ),
                hintText: 'Ask about training, digital literacy, or support...',
                hintStyle: hintText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (!isLoading && _userMessage.text.isNotEmpty) {
                      sendMessage();
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(resChat),
                          strokeWidth: 3,
                        )
                      : Icon(
                          Icons.send,
                          color: _userMessage.text.isNotEmpty
                              ? Colors.black
                              : Colors.grey,
                        ),
                ),
              ),
              style: promptText,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
