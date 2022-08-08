import 'package:flutter/material.dart';

class TextFormApp extends StatelessWidget {
  const TextFormApp({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.icon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.onChanged,
    this.maxLenght,
    this.onTap,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final int? maxLenght;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)
            ),
            child: TextFormField(
              onChanged: onChanged,
              maxLength: maxLenght,
              onTap: onTap,
              validator: validator,
              keyboardType: keyboardType,
              controller: controller,
              obscureText: obscureText,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  icon,
                ),
                suffixIcon: suffixIcon,
                hintText: hintText,
             //   hintStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
