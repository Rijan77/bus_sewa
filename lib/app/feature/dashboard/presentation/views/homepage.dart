import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/top_header.dart';
import 'package:flutter/material.dart';

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
            expandedHeight: 120,
            collapsedHeight: 70,
            pinned: false,

            backgroundColor: const Color(0xff13366E),
            flexibleSpace: FlexibleSpaceBar(
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
                        )
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
          SliverGrid(
            delegate: SliverChildListDelegate([

              TopHeader(
                image: Image.asset("assets/icons/BusSewa New App icons -01.png"), label: "Bus Tickets"),
              TopHeader(image: Image.asset("assets/icons/BusSewa New App icons -02.png"), label: "Reserve"),
              TopHeader(image: Image.asset("assets/icons/Frame 1171275982.png"), label: "Flights"),
              TopHeader(image: Image.asset("assets/icons/BusSewa New App icons -04.png"), label: "My Tickets"),
              
            ]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 2 columns, adjust as needed
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
