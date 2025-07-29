import 'package:flutter/material.dart';
import 'package:shoppe/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: AppColor.primary);
  }
}
