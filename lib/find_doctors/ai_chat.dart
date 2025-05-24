import 'package:flutter/material.dart';
//import 'package:health_app/utils/custom_icons.dart'; // Optional: Custom AI icons
import 'package:flutter/services.dart'; // For haptic feedback

class AiChatPage extends StatefulWidget {
  const AiChatPage({Key? key}) : super(key: key);

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  // Replace with your actual API logic later
  Future<void> _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _messages.add({'sender': 'user', 'text': message});
    });

    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'sender': 'ai',
          'text': 'Here’s a health tip: Stay hydrated and eat balanced meals!'
        });
        _isLoading = false;
        _controller.clear();
      });
    });
  }

  Widget _buildMessageBubble(String text, String sender) {
    final isUser = sender == 'user';
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(0),
      bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(16),
    );

    return Container(
      margin: isUser
          ? const EdgeInsets.fromLTRB(40, 10, 10, 10)
          : const EdgeInsets.fromLTRB(10, 10, 40, 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUser
            ? Colors.teal.shade100
            : Colors.teal.withOpacity(0.05),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 12,
                child: Icon(Icons.smart_toy, color: Colors.white, size: 14),
              ),
            ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isUser ? Colors.teal.shade900 : Colors.grey.shade800,
                fontSize: 15,
              ),
            ),
          ),
          if (isUser)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 12,
                child: Icon(Icons.person, color: Colors.white, size: 14),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.smart_toy, size: 80, color: Colors.teal),
          const SizedBox(height: 16),
          Text(
            'Ask me anything about health!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'I’ll provide health tips, symptom advice, and more.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Row(
      children: [
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 12,
          child: Icon(Icons.smart_toy, color: Colors.white, size: 14),
        ),
        const SizedBox(width: 8),
        const Text(
          'HealthBot is typing...',
          style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            const SizedBox(width: 4),
            _PulseDot(),
            _PulseDot(delay: Duration(milliseconds: 300)),
            _PulseDot(delay: Duration(milliseconds: 600)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.smart_toy, color: Colors.white),
            SizedBox(width: 8),
            Text('AI Chat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.teal,
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {
              HapticFeedback.vibrate();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Voice input is under development'),
                  backgroundColor: Colors.teal,
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty && !_isLoading
                  ? _buildEmptyState()
                  : ListView.builder(
                itemCount: _messages.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < _messages.length) {
                    final msg = _messages[index];
                    return Align(
                      alignment: msg['sender'] == 'user'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: _buildMessageBubble(msg['text']!, msg['sender']!),
                    );
                  } else {
                    return _buildTypingIndicator();
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Type your question...',
                        hintStyle: TextStyle(color: Colors.teal.shade200),
                        prefixIcon: const Icon(Icons.keyboard, color: Colors.teal),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: _isLoading
                      ? null
                      : () {
                    final text = _controller.text;
                    if (text.isNotEmpty) {
                      _sendMessage(text);
                    }
                  },
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _PulseDot extends StatefulWidget {
  final Duration delay;
  const _PulseDot({this.delay = Duration.zero});

  @override
  __PulseDotState createState() => __PulseDotState();
}

class __PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _controller.repeat(period: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final opacity = _controller.isDismissed ? 1.0 : 0.4;
          return Opacity(
            opacity: opacity,
            child: Transform.scale(
              scale: 0.8 + (0.2 * _controller.value),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal.shade600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}