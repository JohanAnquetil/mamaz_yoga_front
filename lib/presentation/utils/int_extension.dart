import 'package:flutter/material.dart';

extension HeightSizedBox on int {
  Widget get toHeight {
    return SizedBox(
      height: toDouble(),
    );
  }
}
