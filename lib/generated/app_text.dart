import 'package:easy_localization/easy_localization.dart';

String tr(
  String text, {
  List<String>? args,
  Map<String, String>? namedArgs,
  String? gender,
}) {
  return text.tr(gender: gender, args: args, namedArgs: namedArgs);
}
