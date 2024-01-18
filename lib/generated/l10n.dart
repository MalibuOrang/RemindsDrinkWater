// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Custom`
  String get textCustom {
    return Intl.message(
      'Custom',
      name: 'textCustom',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back you been missed!`
  String get welcome {
    return Intl.message(
      'Welcome back you been missed!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Continue with`
  String get continueWith {
    return Intl.message(
      'Continue with',
      name: 'continueWith',
      desc: '',
      args: [],
    );
  }

  /// `Remind Drinks Water`
  String get appName {
    return Intl.message(
      'Remind Drinks Water',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Add Water`
  String get addWater {
    return Intl.message(
      'Add Water',
      name: 'addWater',
      desc: '',
      args: [],
    );
  }

  /// `Add cups of water`
  String get nameScreenCups {
    return Intl.message(
      'Add cups of water',
      name: 'nameScreenCups',
      desc: '',
      args: [],
    );
  }

  /// `You get some errors!`
  String get textErrorDrinkWater {
    return Intl.message(
      'You get some errors!',
      name: 'textErrorDrinkWater',
      desc: '',
      args: [],
    );
  }

  /// `Drink water`
  String get textButtonDrinkWater {
    return Intl.message(
      'Drink water',
      name: 'textButtonDrinkWater',
      desc: '',
      args: [],
    );
  }

  /// `Add cups of water`
  String get addCupsOfWater {
    return Intl.message(
      'Add cups of water',
      name: 'addCupsOfWater',
      desc: '',
      args: [],
    );
  }

  /// `You get some errors!`
  String get youGetSomeErrors {
    return Intl.message(
      'You get some errors!',
      name: 'youGetSomeErrors',
      desc: '',
      args: [],
    );
  }

  /// `Drink water`
  String get drinkWater {
    return Intl.message(
      'Drink water',
      name: 'drinkWater',
      desc: '',
      args: [],
    );
  }

  /// `Cups of this day`
  String get cupsOfThisDay {
    return Intl.message(
      'Cups of this day',
      name: 'cupsOfThisDay',
      desc: '',
      args: [],
    );
  }

  /// `Hidration statistic`
  String get hidrationStatistic {
    return Intl.message(
      'Hidration statistic',
      name: 'hidrationStatistic',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccessful {
    return Intl.message(
      'Login successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Charts of week`
  String get chartsOfWeek {
    return Intl.message(
      'Charts of week',
      name: 'chartsOfWeek',
      desc: '',
      args: [],
    );
  }

  /// `Average water drunks:`
  String get averageWaterDrunks {
    return Intl.message(
      'Average water drunks:',
      name: 'averageWaterDrunks',
      desc: '',
      args: [],
    );
  }

  /// `Cups`
  String get cups {
    return Intl.message(
      'Cups',
      name: 'cups',
      desc: '',
      args: [],
    );
  }

  /// `Hidration`
  String get hidration {
    return Intl.message(
      'Hidration',
      name: 'hidration',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message(
      'Timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `You drink water today?`
  String get youDrinkWaterToday {
    return Intl.message(
      'You drink water today?',
      name: 'youDrinkWaterToday',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back you been missed!`
  String get welcomeBackYouveBeenMissed {
    return Intl.message(
      'Welcome back you been missed!',
      name: 'welcomeBackYouveBeenMissed',
      desc: '',
      args: [],
    );
  }

  /// `Remind Drinks Water`
  String get remindDrinksWater {
    return Intl.message(
      'Remind Drinks Water',
      name: 'remindDrinksWater',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get custom {
    return Intl.message(
      'Custom',
      name: 'custom',
      desc: '',
      args: [],
    );
  }

  /// `You dinked {value}ml`
  String youDinkedValueml(Object value) {
    return Intl.message(
      'You dinked ${value}ml',
      name: 'youDinkedValueml',
      desc: '',
      args: [value],
    );
  }

  /// `Please enter a valid number for water amount!`
  String get pleaseEnterAValidNumberForWaterAmount {
    return Intl.message(
      'Please enter a valid number for water amount!',
      name: 'pleaseEnterAValidNumberForWaterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Input custom water`
  String get inputCustomWater {
    return Intl.message(
      'Input custom water',
      name: 'inputCustomWater',
      desc: '',
      args: [],
    );
  }

  /// `900 ml...`
  String get hintCustomAmount {
    return Intl.message(
      '900 ml...',
      name: 'hintCustomAmount',
      desc: '',
      args: [],
    );
  }

  /// `Logout from account`
  String get logoutFromAccount {
    return Intl.message(
      'Logout from account',
      name: 'logoutFromAccount',
      desc: '',
      args: [],
    );
  }

  /// `Logout from the app`
  String get logoutFromTheApp {
    return Intl.message(
      'Logout from the app',
      name: 'logoutFromTheApp',
      desc: '',
      args: [],
    );
  }

  /// ` ml`
  String get MlWater {
    return Intl.message(
      ' ml',
      name: 'MlWater',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
