import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Widget _buildGridCard(Image imageWidget, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: imageWidget,
            ),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9FF),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120,
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
              _buildGridCard(Image.asset("assets/icons/BusSewa New App icons -01.png"), "Bus Tickets"),
              _buildGridCard(Image.asset("assets/icons/BusSewa New App icons -02.png"), "Reserve"),
              _buildGridCard(Image.asset("assets/icons/Frame 1171275982.png"),"Flights"),
              _buildGridCard(Image.asset("assets/icons/BusSewa New App icons -04.png"), "My Tickets"),
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
