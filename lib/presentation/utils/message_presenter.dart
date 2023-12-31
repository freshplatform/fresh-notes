import 'package:flutter/material.dart';
import '../l10n/extensions/localizations.dart';
import 'dialog/w_ok_dialog.dart';

@immutable
class MessagePresenter {
  const MessagePresenter({
    required this.context,
  });

  final BuildContext context;

  Future<void> showMessage(
    String message, {
    bool useSnackBar = true,
  }) async {
    if (!useSnackBar) {
      await showOkDialog(
        context: context,
        options: OkDialogOptions(
          title: context.loc.appName,
          message: message,
        ),
      );
      return;
    }

    final scaffodlMessenger = ScaffoldMessenger.of(context);
    scaffodlMessenger.clearSnackBars();
    final snackBar = scaffodlMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    await snackBar.closed;
  }
}
