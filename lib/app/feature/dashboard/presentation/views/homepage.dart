import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/homepage_widgets/second_header.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9FF),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            collapsedHeight: 70,
            pinned: false,
            backgroundColor: const Color(0xff13366E),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Hello! Harris Ji",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "What would you like to do?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, bottom: 30),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/myphoto.jpg'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,

            delegate: TopHeader(
              items: [
                HeaderItem(
                  image:
                  SvgPicture.asset("assets/icons/BusSewa New App icons -01.svg"),
                  label: "Bus Tickets",
                ),
                HeaderItem(
                  image:
                  SvgPicture.asset("assets/icons/BusSewa New App icons -02.svg"),
                  label: "Reserve",
                ),
                HeaderItem(
                  image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                  label: "Flights",
                ),
                HeaderItem(
                  image:
                  SvgPicture.asset("assets/icons/BusSewa New App icons -04.svg"),
                  label: "My Tickets",
                ),
                // Add more if needed
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SecondHeader(items: [
              SecondHeaderItem(
                  image: SvgPicture.asset(
                      "assets/icons/BusSewa New App icons -08.svg"),
                  label: "Hotel"),
              SecondHeaderItem(
                  image:
                  SvgPicture.asset("assets/icons/BusSewa New App icons -09.svg"),
                  label: "Activity"),
              SecondHeaderItem(
                  image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                  label: "Flight"),
              SecondHeaderItem(
                  image: SvgPicture.asset("assets/icons/Frame 1171275983.svg"),
                  label: "Domestic"),
              SecondHeaderItem(
                  image:
                  SvgPicture.asset("assets/icons/BusSewa New App icons -03.svg"),
                  label: "Tours"),
              SecondHeaderItem(
                  image:
                  SvgPicture.asset("assets/icons/BusSewa New App icons -03.svg"),
                  label: "Vacation"),
              SecondHeaderItem(
                  image: SvgPicture.asset(
                      "assets/icons/BusSewa New App icons -08.svg"),
                  label: "AirBnB"),
              SecondHeaderItem(
                  image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                  label: "Trains"),
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 70,
                  child: Image.asset(
                    "assets/images/Frame 1171276782.png",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PromoCode(
                items: [
                  PromoCodeHeader(
                    title: "Promo Codes",
                    secondTitle: "View All>>",
                    button: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(30, 30),
                        ),
                        child: const Text("All"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton.styleFrom(minimumSize: const Size(30, 30)),
                        child: const Text("Bus"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton.styleFrom(minimumSize: const Size(30, 30)),
                        child: const Text("Tours"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton.styleFrom(minimumSize: const Size(30, 30)),
                        child: const Text("Reservations"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
