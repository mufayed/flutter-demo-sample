import 'package:demo/config/dependances.dart';
import 'package:demo/core/presentation/cubits/beneficiary/get_top_up_history/get_top_up_history_cubit.dart';
import 'package:demo/core/presentation/cubits/user/get_user/get_user_cubit.dart';
import 'package:demo/core/presentation/screens/main/main_screen.dart';
import 'package:demo/core/presentation/styles/theme/theme.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'cubits/beneficiary/add/add_beneficiary_cubit.dart';
import 'cubits/beneficiary/get/get_beneficiaries_cubit.dart';
import 'cubits/beneficiary/remove/remove_beneficiary_cubit.dart';
import 'cubits/beneficiary/top_up/top_up_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AddBeneficiaryCubit(locator()),
          ),
          BlocProvider(
            create: (context) => RemoveBeneficiaryCubit(locator()),
          ),
          BlocProvider(
            create: (context) => GetBeneficiariesCubit(locator()),
          ),
          BlocProvider(
            create: (context) => TopUpCubit(locator()),
          ),
          BlocProvider(
            create: (context) => GetUserCubit(locator()),
          ),
          BlocProvider(
            create: (context) => GetTopUpHistoryCubit(locator()),
          ),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: FigmaColorData.regular().purpleIndigo),
                useMaterial3: true,
                fontFamily: GoogleFonts.sora().fontFamily,
              ),
              home: const MainScreen());
        }));
  }
}
