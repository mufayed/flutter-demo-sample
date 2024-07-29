import 'package:demo/core/presentation/cubits/beneficiary/add/add_beneficiary_cubit.dart';
import 'package:demo/core/presentation/cubits/beneficiary/get/get_beneficiaries_cubit.dart';
import 'package:demo/core/presentation/cubits/user/get_user/get_user_state.dart';
import 'package:demo/core/presentation/screens/main/widgets/body_widget.dart';
import 'package:demo/core/presentation/screens/main/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/beneficiary/beneficiary.dart';
import '../../../domain/entity/user/user.dart';
import '../../bottomsheets/add_beneficiary/add_beneficiary_bottomsheet.dart';
import '../../cubits/beneficiary/top_up/top_up_cubit.dart';
import '../../cubits/user/get_user/get_user_cubit.dart';

class MainScreen extends StatelessWidget with AddBeneficiaryBottomSheet {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TopUpCubit, TopUpState>(
      listener: _topUpListener,
      child: BlocListener<AddBeneficiaryCubit, AddBeneficiaryState>(
        listener: _addBeneficiaryListener,
        child: BlocBuilder<GetUserCubit, GetUserState>(
          bloc: context.read<GetUserCubit>()..getUser(),
          builder: (context, getUserState) {
            return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWidget(
                        user: getUserState is GetUserSuccess
                            ? getUserState.user
                            : User.empty(),
                      ),
                      const BodyWidget()
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showAddBeneficiaryBottomSheet(context,
                        addBeneficiary: (Beneficiary value) {
                      context
                          .read<AddBeneficiaryCubit>()
                          .addBeneficiary(beneficiary: value);
                    });
                  },
                  child: const Icon(Icons.add),
                ));
          },
        ),
      ),
    );
  }

  _addBeneficiaryListener(BuildContext context, AddBeneficiaryState state) {
    if (state is AddBeneficiarySuccess) {
      context.read<GetBeneficiariesCubit>().getBeneficiaries();
    }

    if (state is AddBeneficiaryFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.message),
      ));
    }
  }

  _topUpListener(BuildContext context, TopUpState state) {
    if (state is TopUpSuccess) {
      context.read<GetUserCubit>().getUser();
    }

    if (state is TopUpFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.message),
      ));
    }
  }
}
