import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatbotScreens extends StatefulWidget {
  const ChatbotScreens({super.key});

  @override
  State<ChatbotScreens> createState() => _ChatbotScreensState();
}

class _ChatbotScreensState extends State<ChatbotScreens> {
  final _openAI = OpenAI.instance.build(
    token: dotenv.env['API_KEY'] ?? '',
    baseOption: HttpSetup(
      receiveTimeout: Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser =
      ChatUser(id: "1", firstName: "Nguyễn", lastName: "Hữu Thiện");

  final ChatUser _currenChatbot =
      ChatUser(id: "1", firstName: "Trợ lý", lastName: "ảo");

  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(70), // Tăng chiều cao để có thêm khoảng trống
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)), // Bo góc dưới
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.smart_toy, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                  Text(
                    'Chat bot hỗ trợ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: DashChat(
          currentUser: _currentUser,
          messageOptions: MessageOptions(
            currentUserContainerColor: const Color.fromARGB(255, 19, 131, 23),
            containerColor: Colors.black,
            textColor: Colors.white,
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });
    List<Messages> messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      messages: messagesHistory
          .map((msg) => msg.toJson())
          .toList(), // Chuyển đổi thành danh sách Map
      maxToken: 200,
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
                user: _currenChatbot,
                createdAt: DateTime.now(),
                text: element.message!.content),
          );
        });
      }
    }
  }
}
