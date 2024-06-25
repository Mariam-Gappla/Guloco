import 'package:flutter/material.dart';

class CustomTextFieldCenterlable extends StatefulWidget {
  const CustomTextFieldCenterlable({
    Key? key,
    this.hint,
    this.onChange,
    this.obscure = false,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    bool? isPassword,
    TextInputType? type,
    this.fillColor,
    this.showBorder = true,
    this.prefixText,
    this.onSubmitted,
    this.controller, 
  }) : super(key: key);

  final bool showBorder;
  final Color? fillColor;
  final String? hint;
  final String? prefixText;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool? obscure;
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final bool? ispassword;
  final TextEditingController? controller; 

  @override
  State<CustomTextFieldCenterlable> createState() => _CustomTextFieldCenterlableState();
}

class _CustomTextFieldCenterlableState extends State<CustomTextFieldCenterlable> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        controller: widget.controller,
        onTap: widget.suffixPressed,
        obscureText: widget.obscure!,
        keyboardType: widget.inputType,
        validator: (data) {
          if (data!.isEmpty) {
            return "Value Is Wrong";
          }
        },
        
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hint,
          prefixText: widget.prefixText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 50),
          border: widget.showBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              : InputBorder.none,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon:
              widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
        ),
      ),
    );
  }
}
