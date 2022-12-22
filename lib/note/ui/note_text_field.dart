import 'package:flutter/material.dart';
import 'package:todo/app_localizations.dart';
import 'package:todo/util/string_extension.dart';

class NoteTextField extends StatelessWidget {
  final TextEditingController controller;
  const NoteTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: controller.text == "" ? true : false,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText:
            AppLocalizations.of(context).translate("add-note").capitalize(),
        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
      ),
      maxLines: null,
    );
  }
}