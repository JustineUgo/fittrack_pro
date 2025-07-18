import 'dart:async';
import 'package:fittrack_pro/core/services/storage_service.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_event.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  final StorageService storage;
  ThemeModeBloc({required this.storage})
      : super(_initialMode(storage)) {
    on<SetDarkMode>(_onDarkMode);
    on<SetLightMode>(_onLightMode);
    on<SetSystemMode>(_onSystemMode);
  }

  Future<void> _onDarkMode(SetDarkMode event, Emitter<ThemeModeState> emit) async {
    storage.store(key: StorageService.themeModeKey, value: 'dark');
    emit(DarkMode());
  }

  Future<void> _onLightMode(SetLightMode event, Emitter<ThemeModeState> emit) async {
    storage.store(key: StorageService.themeModeKey, value: 'light');
    emit(LightMode());
  }

  Future<void> _onSystemMode(SetSystemMode event, Emitter<ThemeModeState> emit) async {
    storage.store(key: StorageService.themeModeKey, value: 'system');
    emit(SystemMode());
  }

  static ThemeModeState _initialMode(StorageService storage) {
    String? storedMode = storage.retrieve(key: StorageService.themeModeKey);
    switch (storedMode) {
      case 'system':
        return SystemMode();
      case 'dark':
        return DarkMode();
      case 'light':
        return LightMode();
      default:
      return SystemMode();
    }
  }
}
