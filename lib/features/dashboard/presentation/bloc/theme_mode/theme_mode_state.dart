import 'package:equatable/equatable.dart';

class ThemeModeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DarkMode extends ThemeModeState {}

class LightMode extends ThemeModeState {}

class SystemMode extends ThemeModeState {}