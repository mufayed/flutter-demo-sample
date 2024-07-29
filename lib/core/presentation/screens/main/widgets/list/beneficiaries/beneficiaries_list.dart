import 'package:demo/core/presentation/bottomsheets/top_up/top_up_bottomsheet.dart';
import 'package:demo/core/presentation/cubits/beneficiary/get/get_beneficiaries_cubit.dart';
import 'package:demo/core/presentation/cubits/beneficiary/remove/remove_beneficiary_cubit.dart';
import 'package:demo/core/presentation/cubits/beneficiary/top_up/top_up_cubit.dart';
import 'package:demo/core/presentation/styles/theme/theme.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../domain/entity/beneficiary/beneficiary.dart';

class BeneficiariesList extends StatelessWidget {
  const BeneficiariesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveBeneficiaryCubit, RemoveBeneficiaryState>(
      listener: _handleRemoveBeneficiaryState,
      child: BlocBuilder<GetBeneficiariesCubit, GetBeneficiariesState>(
        bloc: context.read<GetBeneficiariesCubit>()..getBeneficiaries(),
        builder: (context, state) {
          if (state is GetBeneficiariesSuccess) {
            if (state.beneficiaries.isEmpty) {
              return SizedBox(
                width: double.infinity,
                child: Text(
                  'No beneficiaries found',
                  textAlign: TextAlign.center,
                  style: FigmaTextStyleData.regular().regularR6.copyWith(
                        color: FigmaColorData.regular().neutralsSlateGray,
                      ), // Replace with your FigmaTextStyleData if available
                ),
              );
            }

            return SizedBox(
              height: 170,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: state.beneficiaries.length,
                itemBuilder: (context, index) {
                  return BeneficiaryWidget(
                    beneficiary: state.beneficiaries[index],
                  );
                },
              ),
            );
          }

          if (state is GetBeneficiariesFailure) {
            // column with error and retry
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Text(
                    state.message,
                    style: FigmaTextStyleData.regular().regularR6.copyWith(
                          color: FigmaColorData.regular().neutralsSlateGray,
                        ), // Replace with your FigmaTextStyleData if available
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<GetBeneficiariesCubit>().getBeneficiaries();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is GetBeneficiariesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  _handleRemoveBeneficiaryState(
      BuildContext context, RemoveBeneficiaryState state) {
    if (state is RemoveBeneficiarySuccess) {
      context.read<GetBeneficiariesCubit>().getBeneficiaries();
    }
  }
}

class BeneficiaryWidget extends StatelessWidget with TopUpBottomSheet {
  final Beneficiary beneficiary;

  const BeneficiaryWidget({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        context
            .read<RemoveBeneficiaryCubit>()
            .removeBeneficiary(beneficiary.id);
      },
      child: Container(
        width: 38.w,
        margin: EdgeInsetsDirectional.only(end: 2.w, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              beneficiary.nickname,
              textAlign: TextAlign.center,
              style: FigmaTextStyleData.regular().boldB6.copyWith(
                    color: FigmaColorData.regular().purpleIndigo,
                  ), // Replace with your FigmaTextStyleData if available
            ),
            const SizedBox(height: 4),
            Text(
              beneficiary.phoneNumber,
              textAlign: TextAlign.center,
              style: FigmaTextStyleData.regular().regularR6.copyWith(
                    color: FigmaColorData.regular().neutralsSlateGray,
                  ), // Replace with your FigmaTextStyleData if available
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _topUp(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: FigmaColorData.regular().purpleMajorelleBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Recharge now',
                    textAlign: TextAlign.center,
                    style: FigmaTextStyleData.regular().regularR7.copyWith(
                          color: FigmaColorData.regular().neutralsWhite,
                        ), // Replace with your FigmaTextStyleData if available
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _topUp(BuildContext context) {
    showTopUpBottomSheet(context, onTopUpSelected: (amount) {
      context.read<TopUpCubit>().topUp(beneficiary.id, amount);
    });
  }
}
