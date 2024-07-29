import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:demo/core/presentation/styles/theme/theme.g.dart';

import '../../../../../../domain/entity/top_up/top_up_history.dart';
import '../../../../../cubits/beneficiary/get_top_up_history/get_top_up_history_cubit.dart';
import '../../../../../cubits/beneficiary/get_top_up_history/get_top_up_history_state.dart';

class TopUpHistoryList extends StatelessWidget {
  const TopUpHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopUpHistoryCubit, GetTopUpHistoryState>(
      bloc: context.read<GetTopUpHistoryCubit>()..fetchTopUpHistory(),
      builder: (context, state) {
        if (state is GetTopUpHistorySuccess) {
          if (state.history.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Text(
                'No top-up history found',
                textAlign: TextAlign.center,
                style: FigmaTextStyleData.regular().regularR6.copyWith(
                  color: FigmaColorData.regular().neutralsSlateGray,
                ), // Replace with your FigmaTextStyleData if available
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 0,bottom: 60),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.history.length,
            itemBuilder: (context, index) {
              final topUp = state.history[index];
              return TopUpHistoryWidget(topUp: topUp);
            },
          );
        }

        if (state is GetTopUpHistoryFailure) {
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
                    context.read<GetTopUpHistoryCubit>().fetchTopUpHistory();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is GetTopUpHistoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SizedBox();
      },
    );
  }
}

class TopUpHistoryWidget extends StatelessWidget {
  final TopUpHistory topUp;

  const TopUpHistoryWidget({super.key, required this.topUp});

  String _formatDate(DateTime date) {
    return DateFormat('d MMM y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Beneficiary: ${topUp.beneficiaryNickname}',
            style: FigmaTextStyleData.regular().regularR6.copyWith(
              color: FigmaColorData.regular().neutralsSlateGray,
            ), // Replace with your FigmaTextStyleData if available
          ),
          const SizedBox(height: 4),
          Text(
            'Amount: AED ${topUp.amount}',
            style: FigmaTextStyleData.regular().regularR6.copyWith(
              color: FigmaColorData.regular().neutralsSlateGray,
            ), // Replace with your FigmaTextStyleData if available
          ),
          const SizedBox(height: 4),
          Text(
            'Date: ${_formatDate(topUp.date)}',
            style: FigmaTextStyleData.regular().regularR6.copyWith(
              color: FigmaColorData.regular().neutralsSlateGray,
            ), // Replace with your FigmaTextStyleData if available
          ),
        ],
      ),
    );
  }
}