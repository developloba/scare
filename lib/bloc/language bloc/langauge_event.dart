import '../../locale/language.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity language;

  ToggleLanguageEvent(this.language);
}
