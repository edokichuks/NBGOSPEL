// // import 'dart:async';
// // import 'package:bloc/bloc.dart';
// // import '../app_themes.dart';
// // import './bloc.dart';
// //
// // class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
// //   ThemeBloc()
// //       : super(ThemeState(
// //           themeData: AppThemes.appThemeData[AppThemeM.GreyDark],
// //         ));
// //
// //   // @override
// //   // ThemeState get initialState =null;
// //   @override
// //   Stream<ThemeState> mapEventToState(
// //     ThemeEvent event,
// //   ) async* {
// //     if (event is ThemeChanged) {
// //       yield ThemeState(themeData: AppThemes.appThemeData[event.apptheme]);
// //     }
// //   }
// // }
//
// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nbgospel/ui/global/theme/app_themes.dart';
// import 'package:nbgospel/ui/global/theme/bloc/bloc.dart';
//
// class ThemeBloc extends Bloc<ThemeEvent, ThemeState>{
// ThemeBloc (): super(
//   ThemeState(themeData: ThemeData.appThemeData[AppThemeM.GreyDark],)
// );
//
// @override
//   Stream<ThemeState> mapEventToState(
//     ThemeEvent event,
//   ) async* {
//     if (event is ThemeEvent) {
//       yield ThemeState(themeData: AppThemes.appThemeData[event.apptheme]);
//     }
//   }
//
// }
