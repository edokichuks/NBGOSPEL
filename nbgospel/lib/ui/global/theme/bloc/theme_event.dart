import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../app_themes.dart';
//  class ThemeEvent extends Equatable {
//   ThemeEvent([List props = const <dynamic>[]]) : super();
// }
//
// class ThemeChanged extends ThemeEvent {
//   final AppThemes theme;
//
//   ThemeChanged({
//     required this.theme,
//   }) : super([theme]);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }

class ThemeEvent {
  final AppThemeM appThemes;
  ThemeEvent({required this.appThemes});
}