import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/homepage_widgets/top_header.dart';
import '../widgets/homepage_widgets/promo_code.dart';
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
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 150,
                collapsedHeight: 100,
                pinned: true,
                backgroundColor: const Color(0xff13366E),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello! Harris Ji",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
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
                          children: const [
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
                ),
              ),

              // Pad content to make space below overlapping header
              SliverPadding(
                padding: const EdgeInsets.only(top: 50),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SecondHeader(items: [
                      SecondHeaderItem(
                        image: SvgPicture.asset("assets/icons/BusSewa New App icons -08.svg"),
                        label: "Hotel",
                      ),
                      SecondHeaderItem(
                        image: SvgPicture.asset("assets/icons/BusSewa New App icons -09.svg"),
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
                        image: SvgPicture.asset("assets/icons/BusSewa New App icons -03.svg"),
                        label: "Tours",
                      ),
                      SecondHeaderItem(
                        image: SvgPicture.asset("assets/icons/BusSewa New App icons -03.svg"),
                        label: "Vacation",
                      ),
                      SecondHeaderItem(
                        image: SvgPicture.asset("assets/icons/BusSewa New App icons -08.svg"),
                        label: "AirBnB",
                      ),
                      SecondHeaderItem(
                        image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                        label: "Trains",
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 70,
                        child: Image.asset(
                          "assets/images/Frame 1171276782.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
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
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(30, 30),
                                ),
                                child: const Text("Bus"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(30, 30),
                                ),
                                child: const Text("Tours"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(30, 30),
                                ),
                                child: const Text("Reservations"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),

          // Overlapping TopHeaderWidget (half inside AppBar, half outside)
          Positioned(
            top: 125, // SliverAppBar height - half of TopHeaderWidget height
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 100,
                child: TopHeaderWidget(
                  items: [
                    HeaderItem(
                      image: SvgPicture.asset("assets/icons/BusSewa New App icons -01.svg"),
                      label: "Bus Tickets",
                    ),
                    HeaderItem(
                      image: SvgPicture.asset("assets/icons/BusSewa New App icons -02.svg"),
                      label: "Reserve",
                    ),
                    HeaderItem(
                      image: SvgPicture.asset("assets/icons/Frame 1171275982.svg"),
                      label: "Flights",
                    ),
                    HeaderItem(
                      image: SvgPicture.asset("assets/icons/BusSewa New App icons -04.svg"),
                      label: "My Tickets",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
