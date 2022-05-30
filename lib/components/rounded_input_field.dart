import 'package:final_yr_project/components/text_field_container.dart';
import 'package:final_yr_project/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Function(String?)? validator;
  // final GlobalKey? formKey;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.validator,
    // this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: TextFieldContainer(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator as dynamic,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
