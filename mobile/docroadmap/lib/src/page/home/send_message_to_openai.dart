import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendMessageToOpenAI(
    String message, Function(String) onData) async {
  const apiKey = "METTRE LA CLEF ICI !";
  final url = Uri.parse('https://api.openai.com/v1/chat/completions');
  final request = http.Request('POST', url)
    ..headers['Content-Type'] = 'application/json'
    ..headers['Authorization'] = 'Bearer $apiKey'
    ..body = json.encode({
      'model': 'gpt-3.5-turbo',
      'stream': true,
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': message}
      ],
    });

  final response = await request.send();

  if (response.statusCode == 200) {
    response.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((data) {
      if (data.isNotEmpty && data != '[DONE]') {
        try {
          final jsonResponse = json.decode(data.substring(6));
          final content = jsonResponse['choices'][0]['delta']['content'];
          if (content != null) {
            onData(content);
          }
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      }
    });
  } else {
    throw Exception(
        'Failed to load response from OpenAI: ${response.statusCode}, ${response.reasonPhrase}');
  }
}
