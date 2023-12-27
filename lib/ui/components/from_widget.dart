import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/provider/note_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class FromWidget extends StatelessWidget {
  const FromWidget({super.key ,
  required this.btnName,
  required this.func,
  });
  final String btnName;
  final Function func;
  @override
  Widget build(BuildContext context) {
    final titleView = context.watch<NoteProvider>().titleController;
    final textView = context.watch<NoteProvider>().textController;
    return Padding(
      padding:const EdgeInsets.only(
        top: 16, 
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          TextFormWidget(
            labelText:  LocaleKeys.title.tr(),
            hintText: LocaleKeys.title.tr(),
            fromController:  titleView,
          ),
         const SizedBox(height: 16),
         TextFormWidget(
          labelText:  LocaleKeys.note.tr(),
          hintText:  LocaleKeys.note.tr(),
          fromController: textView,
         ),
         const SizedBox(height: 16),
         SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            backgroundColor: AppColors.backgroundColor,
            onPressed: (){
              func();
            }, 
            label: Text(
              btnName, 
              style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.purple,
            ),
            ),
            ),
         )
        ],
      ),
    );
  }
}



class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.fromController,
  });
  final String labelText,hintText;
  final TextEditingController fromController;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fromController,
      cursorColor: AppColors.gray,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:  AppStyle.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.gray
        ),
        hintText: hintText,
        hintStyle: AppStyle.fontStyle.copyWith(
          fontSize: 16
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        )
      ),
    );
  }
}