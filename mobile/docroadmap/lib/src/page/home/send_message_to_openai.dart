import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<void> sendMessageToOpenAI(
    String message, Function(String) onData) async {
  final apiKey = dotenv.env['OPENAI_KEY'];

  if (apiKey == null) {
    throw Exception('API key not found in .env file');
  }

  final url = Uri.parse('https://api.openai.com/v1/chat/completions');
  final request = http.Request('POST', url)
    ..headers['Content-Type'] = 'application/json'
    ..headers['Authorization'] = 'Bearer $apiKey'
    ..body = json.encode({
      'model': 'gpt-3.5-turbo',
      'stream': true,
      'messages': [
        {
          'role': 'system',
          'content':
              'Tu es Donna, une assistante experte en démarches administratives françaises. Tu ne réponds qu\'aux questions concernant les procédures administratives en France.'
        },
        {'role': 'user', 'content': message}
      ],
    });

  final response = await request.send();

  if (response.statusCode == 200) {
    response.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((data) {
      if (data.contains('[DONE]')) {
        return;
      }
      if (data.startsWith('data: ')) {
        try {
          final jsonResponse = json.decode(data.substring(6));
          final finishReason = jsonResponse['choices'][0]['finish_reason'];
          final test = jsonResponse['choices'][0]['finish_reason'];
          if (test == 'stop') {
            debugPrint('Stream finished with reason: $finishReason');
            return;
          }
          if (finishReason != null && finishReason == 'stop') {
            debugPrint('Stream finished with reason: $finishReason');
            return;
          }
          final content = jsonResponse['choices'][0]['delta']['content'];
          if (content != null && content.isNotEmpty) {
            onData(content);
          }
        } catch (e) {
          debugPrint('Error decoding JSON: $e');
        }
      }
    }, onError: (error) {
      debugPrint('Stream error: $error');
    });
  } else {
    throw Exception(
        'Failed to load response from OpenAI: ${response.statusCode}, ${response.reasonPhrase}');
  }
}
