import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? prefixIcon;
  final IconData? trailingIcon;
  final bool isPasswordField;
  final String hintText;
   TextEditingController? tcontroller;

   CustomTextFormField({
    Key? key,
     this.prefixIcon,
    this.trailingIcon,
    this.isPasswordField = false,
    required this.hintText,
    this.tcontroller
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.tcontroller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontFamily: AppFonts.secondary),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: AppColors.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        suffixIcon: widget.isPasswordField || widget.trailingIcon != null
            ? IconButton(
                icon: Icon(
                  widget.isPasswordField
                      ? (_obscureText ? Icons.visibility : Icons.visibility_off)
                      : widget.trailingIcon,
                  color: Colors.grey,
                ),
                onPressed: widget.isPasswordField
                    ? () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }
                    : null,
              )
            : null,
      ),
    );
  }
}
