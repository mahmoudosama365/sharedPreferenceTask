import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';

typedef MyValidator = String? Function(String?)? ;
class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.borderColor,this.hintText ,
    this.hintStyle,this.prefixIcon,this.labelText,
    this.labelStyle,this.suffixIcon,this.maxLines,
    this.controller,this.validator});
  Color? borderColor ;
  String? hintText ;
  TextStyle? hintStyle ;
  Widget? prefixIcon ;
  String? labelText ;
  TextStyle? labelStyle ;
  Widget? suffixIcon ;
  int? maxLines ;
  TextEditingController? controller ;
  MyValidator validator ;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller ,
      maxLines: maxLines ?? 1,
      cursorColor: Appcolors.primaryLight,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ??Appcolors.greyColor, 
              width:  1 ,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ??Appcolors.greyColor, 
              width:  1 ,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Appcolors.redColor,
              width:  1 ,
            ),
          ),

          hintText: hintText,
          hintStyle: hintStyle ?? AppStyles.medium16Grey,
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: prefixIcon ,
          suffixIcon: suffixIcon,
      ),
    );
  }
}