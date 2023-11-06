import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app_localizations.dart';
import 'package:todo/theme/cubit/theme_cubit.dart';
import 'package:todo/theme/ui/widget/theme_list_tile_select.dart';
import 'package:todo/util/string_extension.dart';

class ThemeItem {
  final String name;
  final ThemeMode value;

  ThemeItem({required this.name, required this.value});
}

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ThemeItem> themes = [
      ThemeItem(
        name: AppLocalizations.of(context).translate("system"),
        value: ThemeMode.system,
      ),
      ThemeItem(
        name: AppLocalizations.of(context).translate("light"),
        value: ThemeMode.light,
      ),
      ThemeItem(
        name: AppLocalizations.of(context).translate("dark"),
        value: ThemeMode.dark,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title:
            Text(AppLocalizations.of(context).translate("theme").capitalize()),
      ),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, appTheme) {
          return ListView.builder(
            itemCount: themes.length,
            itemBuilder: (context, index) {
              ThemeItem theme = themes[index];
              return ThemeListTileSelect(themeItem: theme);
            },
          );
        },
      ),
    );
  }
}
