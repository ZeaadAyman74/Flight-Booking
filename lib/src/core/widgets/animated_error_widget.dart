import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/retry_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedErrorWidget extends StatelessWidget {
  const AnimatedErrorWidget(
      {super.key, required this.lottieFilePath, this.message, this.onRetry});

  final String lottieFilePath;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(lottieFilePath,
            width: context.width,
            height: context.height * .5,
            fit: BoxFit.contain,
            repeat: false),
        Text(
          message!,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        if(onRetry!=null)
        RetryButton(onPressed: onRetry!,)
      ],
    );
  }
}
