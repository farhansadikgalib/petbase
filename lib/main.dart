import 'package:flutter/material.dart';
import 'package:pet_app/theme/my_theme.dart';
import 'package:pet_app/view_models/my_theme_view_model.dart';
import 'package:stacked/stacked.dart';
import 'screens/root_app.dart';
import 'router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyThemeProvider>.reactive(
      viewModelBuilder: () => MyThemeProvider(),
      onModelReady: (viewModel)=> viewModel.getMyTheme(),
      builder: (context, viewModel, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          title: 'petBase',
          themeMode: viewModel.themeMode,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          home: RootApp(),
        );
      },
    );
  }

}