import 'package:final_yr_project/components/text_field_container.dart';
import 'package:final_yr_project/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Function(String?)? validator;
  // final GlobalKey? formKey;
  const RoundedPasswordField({
    Key? key,
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
          obscureText: true,
          controller: controller,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator as dynamic,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            // suffixIcon: Icon(
            //   Icons.visibility,
            //   color: kPrimaryColor,
            // ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
