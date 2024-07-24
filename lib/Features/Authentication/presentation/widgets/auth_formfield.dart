import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors/app_colors.dart';

class AuthFormField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String? value) validate;
  final String? text;
  final Function? onFieldSubmit;
  final IconData? prefixIcon;
  final bool isPassword;
  final IconData? suffixIcon;
  final Function? suffixOnPressed;
  final bool? noBorder;
  final bool? textLabel;
  final ValueChanged<String>? onChange;
  final Function? onTap;
  final String? descriptionField;
  final bool important;
  final bool multiline;
  final int? maxLength;
  final bool readOnly;
  final bool wantDigitOnly;

  const AuthFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    required this.text,
    this.descriptionField,
    this.onFieldSubmit,
    this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.suffixOnPressed,
    this.noBorder = false,
    this.textLabel = false,
    this.onTap,
    this.onChange,
    this.important = false,
    this.multiline = false,
    this.maxLength,
    this.readOnly = false,
    this.wantDigitOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        descriptionField != null
            ? Row(
                children: [
                  Text(
                    descriptionField.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.foreignColor),
                  ),
                  if (important != false) const SizedBox(width: 3),
                  if (important != false)
                    Text(
                      "*",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.redColor),
                    ),
                ],
              )
            : const SizedBox(),
        descriptionField != null
            ? SizedBox(
                height: 3.h,
              )
            : const SizedBox(),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 5.h, top: 8.h),
          child: TextFormField(
            keyboardType: type,
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium,
            onTap: onTap != null
                ? () {
                    onTap!();
                  }
                : null,
            validator: (value) {
              return validate(value);
            },
            onChanged: onChange != null
                ? (value) {
                    onChange!(value);
                  }
                : null,
            obscureText: isPassword,
            inputFormatters: wantDigitOnly != false
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]
                : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1.sw > 600 ? 0.03.sw : 0.05.sw,
                vertical: 1.sw > 600 ? 0.025.sh : 0.013.sh,
              ),
              hintText: textLabel == false ? text : null,
              label: textLabel != false
                  ? Text(
                      text.toString(),
                    )
                  : null,
              hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 11),
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      size: 22.w,
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        size: 22.w,
                      ),
                      onPressed: () {
                        suffixOnPressed!();
                      })
                  : null,
              enabledBorder: noBorder == true
                  ? OutlineInputBorder(borderSide: BorderSide(color: AppColors.lightGreyColor.withOpacity(0.3)), borderRadius: BorderRadius.circular(7))
                  : null,
              focusedBorder: noBorder == true
                  ? OutlineInputBorder(borderSide: BorderSide(color: AppColors.lightGreyColor.withOpacity(0.3)), borderRadius: BorderRadius.circular(7))
                  : null,
              border: noBorder == true
                  ? OutlineInputBorder(borderSide: BorderSide(color: AppColors.lightGreyColor.withOpacity(0.3)), borderRadius: BorderRadius.circular(7))
                  : null,
              fillColor: noBorder == true ? AppColors.lightGreyColor.withOpacity(0.3) : null,
              filled: noBorder == true,
            ),
            expands: false,
            minLines: null,
            maxLines: multiline == false ? 1 : 2,
            maxLength: maxLength,
            readOnly: readOnly,
          ),
        ),
      ],
    );
  }
}
