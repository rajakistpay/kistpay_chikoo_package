import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _PaymentDialog extends StatelessWidget {
  final String amount;
  final String voucherId;

  const _PaymentDialog({required this.amount, required this.voucherId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Amount',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Copy your voucher ID and pay your bill through JazzCash outlet.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.content_copy),
              const SizedBox(width: 8.0),
              Text(
                'Voucher ID: $voucherId',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _copyToClipboard(context, voucherId);
            },
            child: const Text('Copy Voucher ID'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}


void showPaymentDialog(BuildContext context, String amount, String voucherId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return _PaymentDialog(amount: amount, voucherId: voucherId);
    },
  );
}