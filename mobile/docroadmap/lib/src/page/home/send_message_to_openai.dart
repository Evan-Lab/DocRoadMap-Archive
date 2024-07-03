import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> sendMessageToOpenAI(String message) async {
  const apiKey = "Clef à mettre";
  final url = Uri.parse('https://api.openai.com/v1/chat/completions');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: json.encode({
      'model': 'gpt-3.5-turbo-0125',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': message}
      ],
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['choices'][0]['message']['content'].trim();
  } else {
    throw Exception(
        'Failed to load response from OpenAI: ${response.statusCode}, ${response.body}');
  }
}
