import 'package:app_shoes_ecommerce/core/theme/theme_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeData? themeData = AppTheme.lightTheme;
  ThemeBloc()
      : super(ThemeState(
            themeData: ThemeDatabaseService.getThemeSettings() == 1
                ? AppTheme.darkTheme
                : AppTheme.lightTheme)) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(
          themeData: event.theme == AppTheme.darkTheme
              ? AppTheme.darkTheme
              : AppTheme.lightTheme));
      themeData = event.theme;
    });
  }
}
