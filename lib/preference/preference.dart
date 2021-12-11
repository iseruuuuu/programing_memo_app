import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  memomemo,
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<List<String>> load(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getStringList(EnumToString.convertToString(key)) ?? [];
    return value;
  }

  Future<void> save(PreferenceKey key, List<String> value) async {
    final pref = await preference;
    await pref.setStringList(EnumToString.convertToString(key), value);
  }

// Future<int> getInt(PreferenceKey key) async {
//   final pref = await preference;
//   final value = pref.getInt(EnumToString.convertToString(key)) ?? 0;
//   return value;
// }
//
// Future<void> setInt(PreferenceKey key, int value) async {
//   final pref = await preference;
//   await pref.setInt(EnumToString.convertToString(key), value);
// }
}
