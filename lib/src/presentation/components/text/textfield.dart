
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';


class GlobalTextFiled extends StatelessWidget {
  GlobalTextFiled({super.key, required this.text,required this.controller});
  final String text;
   TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 120,
    child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          fillColor: context.color.yellow,
          focusedBorder: OutlineInputBorder(
            borderRadius: AppUtils.kBorderRadius10,
            borderSide:  BorderSide(
              color:context.color.yellow,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: AppUtils.kBorderRadius10,
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
  );
}