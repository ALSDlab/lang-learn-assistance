import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'setting_page_state.freezed.dart';

part 'setting_page_state.g.dart';

@freezed
class SettingPageState with _$SettingPageState {
  const factory SettingPageState({
    @Default(false) bool tapped,
    @Default('') String selectedLanguage,
    @Default('') String targetLanguage,
    @Default('') String selectedLevel,
    
  }) = _SettingPageState;
  
  factory SettingPageState.fromJson(Map<String, dynamic> json) => _$SettingPageStateFromJson(json); 
}