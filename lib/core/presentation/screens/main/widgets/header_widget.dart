import 'package:demo/core/domain/entity/user/user.dart';
import 'package:demo/core/presentation/styles/media/images.dart';
import 'package:demo/core/presentation/styles/theme/theme.g.dart';
import 'package:demo/core/presentation/styles/theme/widgets.g.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final User user;

  const HeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: FigmaColorData.regular().purpleIndigo,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 50,
          ),
          BarSectionWidget(
            firstName: user.name,
            profileImageId: "1",
          ),
          const SizedBox(
            height: 16,
          ),
          BalanceViewCard(
            balance: user.balance.toString(),
            currency: "AED",
          ),
        ],
      ),
    );
  }
}

class BarSectionWidget extends StatelessWidget {
  final String? firstName;
  final String? profileImageId;

  const BarSectionWidget({super.key, this.firstName, this.profileImageId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Profile image
        Image.asset(
          Images.getProfileImage(profileImageId: profileImageId),
          width: 48,
          height: 48,
        ),
        const SizedBox(width: 8),
        FigmaText.boldB6(
          'Hello,\n$firstName!',
          color: Colors.white,
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class BalanceViewCard extends StatelessWidget {
  final String? balance;
  final String? currency;

  const BalanceViewCard({
    super.key,
    this.balance,
    this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF331098),
            Color(0xFF5033A4),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FigmaText.regularR7(
            'Main balance',
            color: Color(0xFFB2A1E4),
          ),
          FigmaText.boldB1(
            '$currency $balance',
            color: FigmaColorData.regular().neutralsWhite,
          ),
        ],
      ),
    );
  }
}

class BalanceViewCardAction extends StatelessWidget {
  final String actionName;
  final IconData icon;
  final VoidCallback onPressed;

  const BalanceViewCardAction(
      {super.key,
      required this.actionName,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: FigmaColorData.regular().neutralsWhite,
            size: 28,
          ),
          const SizedBox(
            height: 8,
          ),
          FigmaText.regularR7(
            actionName,
            color: FigmaColorData.regular().neutralsWhite,
          ),
        ],
      ),
    );
  }
}
