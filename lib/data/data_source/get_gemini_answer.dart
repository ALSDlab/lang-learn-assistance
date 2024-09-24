import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/dtos/day_sentences_dto.dart';
import 'package:lang_learn/data/dtos/quiz_dto.dart';
import 'package:lang_learn/data/dtos/word_searches_dto.dart';

import '../../env/env.dart';
import '../../utils/simple_logger.dart';

class GetGeminiAnswer {
  static const String _apiKey = Env.geminiApiKey;
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: _apiKey,
  );

  Future<Result<DaySentencesDto>> daySentencesAnswer(String question) async {
    try {
      final ChatSession chat = _model.startChat();

      final response = await chat.sendMessage(
        Content.text(question),
      );
      final text = response.text?.replaceAll('json', '').replaceAll("```", '');
      if (text != null) {
        final jsonText = json.decode(text);
        DaySentencesDto result = DaySentencesDto.fromJson(jsonText);
        return Result.success(result);
      } else {
        return const Result.error('Cannot get the Answer');
      }
    } catch (e) {
      logger.info('GEMINI Communication Error => $e');
      throw Exception(e);
    }
  }

  Future<Result<List<QuizDto>>> quizAnswer(String question) async {
    try {
      final ChatSession chat = _model.startChat();

      final response = await chat.sendMessage(
        Content.text(question),
      );
      final text = response.text?.replaceAll('json', '').replaceAll("```", '');
      if (text != null) {
        final List<dynamic> jsonText = json.decode(text);
        final List<QuizDto> quizList = jsonText.map((e) => QuizDto.fromJson(e)).toList();
        return Result.success(quizList);
      } else {
        return const Result.error('Cannot get the Answer');
      }
    } catch (e) {
      logger.info('GEMINI Communication Error => $e');
      throw Exception(e);
    }
  }

  Future<Result<WordSearchesDto>> wordSearchesAnswer(String question) async {
    try {
      final ChatSession chat = _model.startChat();

      final response = await chat.sendMessage(
        Content.text(question),
      );
      final text = response.text?.replaceAll('json', '').replaceAll("```", '');
      if (text != null) {
        final jsonText = json.decode(text);
        WordSearchesDto result = WordSearchesDto.fromJson(jsonText);
        return Result.success(result);
      } else {
        return const Result.error('Cannot get the Answer');
      }
    } catch (e) {
      logger.info('GEMINI Communication Error => $e');
      throw Exception(e);
    }
  }
}
