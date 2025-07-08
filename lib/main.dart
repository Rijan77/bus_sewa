import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/blogs/blogs_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/offers/offers_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/promo_codes/promo_codes_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/recent_searches/recent_searches_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/socials_shares/social_shares_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/socials_shares/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/feature/dashboard/presentation/blocs/flash_sales/flash_sales_data_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => FlashSalesDataCubit()),
            BlocProvider(create: (_)=> RecentSearchesCubit()),
            BlocProvider(create: (_)=> PromoCodesCubit()),
            BlocProvider(create: (_)=> BlogsCubit()),
            BlocProvider(create: (_)=> SocialSharesCubit()),
            BlocProvider(create: (_)=> OffersCubit())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const VideoPlayer(), // 👈 Your main widget goes here
    );
  }
}
