import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class MessageDialog extends StatelessWidget {
  String message;

  MessageDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Text(message),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child:Text(StringsManager.ok.tr(),style: TextStyle(
          color: Colors.white,
        ),)),
      ],
    );
  }
}