import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/blogs/blogs_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/flash_sales/flash_sales_data_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/promo_codes/promo_codes_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/recent_searches/recent_searches_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/flash_sales/flash_sales_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/homepage_widgets/blogs_section/blogs_main.dart';
import '../widgets/homepage_widgets/gift_section/gift_section_main.dart';
import '../widgets/homepage_widgets/offer_for_you/offer_main.dart';
import '../widgets/homepage_widgets/promo_code/promo_code.dart';
import '../widgets/homepage_widgets/recent_seraches/recent_search.dart';
import '../widgets/homepage_widgets/socials_shares/socials_shares_main.dart';
import '../widgets/homepage_widgets/top_header.dart'; // Your data class
import '../widgets/homepage_widgets/second_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  // bool _isScrolled = false;

  final ValueNotifier<bool> _isScrolled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final isScrolledNow = _scrollController.offset > 45;
      if (_isScrolled.value != isScrolledNow) {
        _isScrolled.value = isScrolledNow;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isScrolled,
        builder: (context, value, _) {
          return Scaffold(
            backgroundColor: const Color(0xffF9F9FF),
            body: RefreshIndicator(
              onRefresh: () async{
                try {
                  await context.read<PromoCodesCubit>().fetchPromoCode();
                  await context.read<RecentSearchesCubit>().fetchSearchData();
                  await context.read<FlashSalesDataCubit>().fetchData();
                  await context.read<BlogsCubit>().fetchBlogData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Refreshed Successfully")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Refresh Failed")),
                  );
                }
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 0.25.sh,
                    collapsedHeight: 0.13.sh,
                    backgroundColor:
                        value ? const Color(0xff13366E) : const Color(0xffF9F9FF),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16))),
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      // stretchModes: const <StretchMode>[
                      //   StretchMode.fadeTitle,
                      // ],
                      centerTitle: true,
                      expandedTitleScale: 1.01,
                      title: TopHeaderWidget(
                        items: [
                          HeaderItem(
                            image: SvgPicture.asset(
                                "assets/icons/BusSewa New App icons -01.svg"),
                            label: "Bus Tickets",
                            isBold: true,
                          ),
                          HeaderItem(
                            image: SvgPicture.asset(
                                "assets/icons/BusSewa New App icons -02.svg"),
                            label: "Reserve",
                          ),
                          HeaderItem(
                            image: SvgPicture.asset(
                                "assets/icons/Frame 1171275982.svg"),
                            label: "Flights",
                          ),
                          HeaderItem(
                            image: SvgPicture.asset(
                                "assets/icons/BusSewa New App icons -04.svg"),
                            label: "My Tickets",
                          ),
                        ],
                      ),
                      collapseMode: CollapseMode.parallax,
                      background: Stack(
                        clipBehavior: Clip.none, // Allow overflow
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180,
                                color: const Color(0xff13366E),
                                padding: const EdgeInsets.only(
                                    top: 30, left: 16, right: 16),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 50),
                                          child: Text(
                                            "Hello! Harris Ji",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "What would you like to do?",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.notifications_none_outlined,
                                            color: Colors.white, size: 30),
                                        SizedBox(width: 10),
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              'https://i.pinimg.com/736x/dc/fc/a2/dcfca2bb4dc9e17587718688304d9c2b.jpg'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    width: double.infinity,
                                    color: const Color(0xffF9F9FF)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Below the AppBar
                  SliverToBoxAdapter(
                    child: Container(
                      child: SecondHeader(items: [
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/BusSewa New App icons -08.svg"),
                          label: "Hotel",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/BusSewa New App icons -09.svg"),
                          label: "Activity",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/Frame 1171275982.svg"),
                          label: "Flight",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/Frame 1171275983.svg"),
                          label: "Domestic",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/BusSewa New App icons -03.svg"),
                          label: "Tours",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/BusSewa New App icons -03.svg"),
                          label: "Vacation",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/BusSewa New App icons -08.svg"),
                          label: "AirBnB",
                        ),
                        SecondHeaderItem(
                          image: SvgPicture.asset(
                              "assets/icons/Frame 1171275982.svg"),
                          label: "Trains",
                        ),
                      ]),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 11, bottom: 8, right: 8, left: 8),
                      child: GiftSectionMain(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: PromoCode(),
                    ),
                  ),
                  // Placeholder containers
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RecentSearch(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlashSalesMain(),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: OfferMain(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SocialsSharesMain(),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BlogsMain(),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
