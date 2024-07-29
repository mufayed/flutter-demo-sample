import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../domain/entity/beneficiary/beneficiary.dart';

class AddBeneficiaryForm extends StatefulWidget {
  final ValueChanged<Beneficiary> addBeneficiary;

  AddBeneficiaryForm({required this.addBeneficiary});

  @override
  _AddBeneficiaryFormState createState() => _AddBeneficiaryFormState();
}

class _AddBeneficiaryFormState extends State<AddBeneficiaryForm> {
  final _nicknameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isButtonEnabled = false;
  String? _phoneNumberError;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_validateForm);
    _phoneNumberController.addListener(_validateForm);
  }

  void _validateForm() {
    final isNicknameNotEmpty = _nicknameController.text.isNotEmpty;
    final phoneNumber = _phoneNumberController.text;

    setState(() {
      _isButtonEnabled = isNicknameNotEmpty && _isValidPhoneNumber(phoneNumber);
      _phoneNumberError =
          _isValidPhoneNumber(phoneNumber) ? null : 'Invalid UAE phone number';
    });
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^(?:05|5)[0-9]{8}$');
    return regex.hasMatch(phoneNumber);
  }

  String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('05')) {
      return '+971${phoneNumber.substring(1)}';
    } else if (phoneNumber.startsWith('5')) {
      return '+971$phoneNumber';
    }
    return phoneNumber; // This should never happen due to validation
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nicknameController,
            decoration: const InputDecoration(
              labelText: 'Nickname',
            ),
            maxLength: 20,
          ),
          TextField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              errorText: _phoneNumberError,
              prefixText: '+971 ',
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isButtonEnabled
                ? () {
                    final nickname = _nicknameController.text;
                    final phoneNumber = _phoneNumberController.text;
                    final formattedPhoneNumber =
                        _formatPhoneNumber(phoneNumber);

                    final beneficiary = Beneficiary(
                      nickname: nickname,
                      id: formattedPhoneNumber,
                      phoneNumber: formattedPhoneNumber,
                    );

                    widget.addBeneficiary(beneficiary);
                    Navigator.of(context).pop();
                  }
                : null,
            child: const Text('Add Beneficiary'),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
