import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movieapp/router.gr.dart';
import 'package:movieapp/themes/bloc/theme_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'MovieApp',
        initialRoute: Router.movieListPage,
        onGenerateRoute: Router.onGenerateRoute,
        navigatorKey: Router.navigator.key,
        theme: state.themeData,
        supportedLocales: [
          Locale('en', 'UK'),
          Locale('de', 'DE'),
        ],
        localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      ),
    );
  }
}
