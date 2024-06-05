import 'package:flutter/material.dart';
import 'package:nike/common/exception.dart';

class AppErrorException extends StatelessWidget {
  final AppException exception;
  final GestureTapCallback onPressed;
  const AppErrorException({
    super.key,
    required this.exception,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            exception.message,
            style: themeData.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(themeData.colorScheme.primary),
                foregroundColor: const MaterialStatePropertyAll(Colors.white)),
            onPressed: onPressed,
            child: const Text('تلاش دوباره'),
          ),
        ],
      ),
    );
  }
}
