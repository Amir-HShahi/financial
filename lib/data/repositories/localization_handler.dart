import 'package:flutter/cupertino.dart';

import '../constants/localization/app_localizations.dart';


/// A utility class that handles localization-related operations
abstract class LocalizationHandler {
  /// Retrieves the localization instance for the current context
  ///
  /// [context] The BuildContext from which to obtain the localization
  ///
  /// Returns an [AppLocalizations] instance containing localized strings and resources
  /// The '!' operator indicates that we're certain the value won't be null in normal circumstances
  ///
  /// Usage example:
  /// ```dart
  /// final localizations = LocalizationHandler.getLocale(context);
  /// String translatedText = localizations.someTranslatedString;
  /// ```
  static AppLocalizations getLocale(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
