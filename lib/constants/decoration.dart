import 'package:flutter/material.dart';

final kTextFormFieldDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10.0),
  ),
  hintText: 'Phone, email or username',
  hintStyle: TextStyle(color: Colors.grey),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10.0),
  ),
);
