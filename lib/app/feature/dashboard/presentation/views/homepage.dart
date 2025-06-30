import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/flash_sales/flash_sales_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/homepage_widgets/offer_for_you/offer_main.dart';
import '../widgets/homepage_widgets/promo_code/promo_code.dart';
import '../widgets/homepage_widgets/recent_seraches/recent_search.dart';
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
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final bool isScrolledNow = _scrollController.offset > 45;
      if (isScrolledNow != _isScrolled) {
        setState(() {
          _isScrolled = isScrolledNow;
        });
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
    return Scaffold(
      backgroundColor: const Color(0xffF9F9FF),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 0.25.sh,
            collapsedHeight: 0.13.sh,
            backgroundColor:
                _isScrolled ? const Color(0xff13366E) : const Color(0xffF9F9FF),
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
              expandedTitleScale: 1,
              title: TopHeaderWidget(
                items: [
                  HeaderItem(
                    image: SvgPicture.asset(
                        "assets/icons/BusSewa New App icons -01.svg"),
                    label: "Bus Tickets",
                  ),
                  HeaderItem(
                    image: SvgPicture.asset(
                        "assets/icons/BusSewa New App icons -02.svg"),
                    label: "Reserve",
                  ),
                  HeaderItem(
                    image:
                        SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
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
                        padding:
                            const EdgeInsets.only(top: 30, left: 16, right: 16),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text(
                                    "Hello! Rijan Ji",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
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
                                  backgroundImage:
                                      AssetImage('assets/images/myphoto.jpg'),
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
                  // 👇 Overlay widget
                  // Positioned(
                  //   top: 130,// Half of its height to overlay evenly
                  //   left: 10,
                  //   right: 10,
                  //   child: SizedBox(
                  //     height: 100,
                  //     child: TopHeaderWidget(
                  //       items: [
                  //         HeaderItem(
                  //           image: SvgPicture.asset("assets/icons/BusSewa New App icons -01.svg"),
                  //           label: "Bus Tickets",
                  //         ),
                  //         HeaderItem(
                  //           image: SvgPicture.asset("assets/icons/BusSewa New App icons -02.svg"),
                  //           label: "Reserve",
                  //         ),
                  //         HeaderItem(
                  //           image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                  //           label: "Flights",
                  //         ),
                  //         HeaderItem(
                  //           image: SvgPicture.asset("assets/icons/BusSewa New App icons -04.svg"),
                  //           label: "My Tickets",
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
                  image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                  label: "Flight",
                ),
                SecondHeaderItem(
                  image: SvgPicture.asset("assets/icons/Frame 1171275983.svg"),
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
                  image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                  label: "Trains",
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Image.asset(
                        "assets/images/Frame 1171276782.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Image.asset(
                        "assets/images/Frame 1171276782.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: PromoCode(),

              // PromoCode(
              //   items: [
              //     PromoCodeHeader(
              //       title: "Promo Codes",
              //       secondTitle: "View All>>",
              //       button: [
              //         ElevatedButton.icon(
              //           onPressed: () {},
              //           style: ElevatedButton.styleFrom(
              //             minimumSize: const Size(30, 30),
              //           ),
              //           icon: const Icon(Icons.check, color: Colors.blue),
              //           label: const Text("All"),
              //         ),
              //
              //         ElevatedButton(
              //           onPressed: () {},
              //           style: ElevatedButton.styleFrom(
              //             minimumSize: const Size(30, 30),
              //           ),
              //           child: const Text("Bus"),
              //         ),
              //         ElevatedButton(
              //           onPressed: () {},
              //           style: ElevatedButton.styleFrom(
              //             minimumSize: const Size(30, 30),
              //           ),
              //           child: const Text("Tours"),
              //         ),
              //         ElevatedButton(
              //           onPressed: () {},
              //           style: ElevatedButton.styleFrom(
              //             minimumSize: const Size(30, 30),
              //           ),
              //           child: const Text("Reservations"),
              //         ),
              //       ],
              //
              //       container: [
              //         Container(
              //           height: 50,
              //           width: 50,
              //           color: Colors.blueGrey,
              //         )
              //       ]
              //
              //     ),
              //
              //   ],
              // ),
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

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OfferMain(),
            ),
          )

        ],
      ),
    );
  }
}
