import 'package:flutter/material.dart';
import '../../../domain/entity/beneficiary/beneficiary.dart';
import 'add_beneficiary_form.dart';

mixin AddBeneficiaryBottomSheet {
  void showAddBeneficiaryBottomSheet(
      BuildContext context, {
        required ValueChanged<Beneficiary> addBeneficiary,
      }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddBeneficiaryForm(addBeneficiary: addBeneficiary);
      },
    );
  }
}
