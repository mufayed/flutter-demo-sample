import 'package:flutter/material.dart';

class TopUpView extends StatefulWidget {
  final ValueChanged<double> onTopUpSelected;

  TopUpView({required this.onTopUpSelected});

  @override
  _TopUpViewState createState() => _TopUpViewState();
}

class _TopUpViewState extends State<TopUpView> {
  final List<double> _topUpOptions = [5, 10, 20, 30, 50, 75, 100];
  double? _selectedAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Amount',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: _topUpOptions.length,
            itemBuilder: (context, index) {
              final amount = _topUpOptions[index];
              return RadioListTile<double>(
                title: Text('AED ${amount.toInt()}'),
                value: amount,
                groupValue: _selectedAmount,
                onChanged: (value) {
                  setState(() {
                    _selectedAmount = value;
                  });
                },
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _selectedAmount != null
                ? () {
                    widget.onTopUpSelected(_selectedAmount!);
                    Navigator.of(context).pop();
                  }
                : null,
            child: const Text('Top Up'),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
