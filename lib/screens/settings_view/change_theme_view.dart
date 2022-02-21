import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/view_models/my_theme_view_model.dart';
import 'package:pet_app/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class ChangeThemeView extends ViewModelWidget<MyThemeProvider> {
  const ChangeThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MyThemeProvider myThemeProvider) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    myThemeProvider.toggleTheme(ThemeMode.light);
                  },
                  title: "Light",
                  bgColor: red,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    myThemeProvider.toggleTheme(ThemeMode.dark);
                  },
                  title: "Dark",
                  bgColor: red,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

