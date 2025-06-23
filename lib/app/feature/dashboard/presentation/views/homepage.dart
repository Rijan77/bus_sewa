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
      body:
       CustomScrollView(
    slivers: [
      SliverAppBar(
        expandedHeight: 120,
      
        backgroundColor: Color(0xff13366E),
        flexibleSpace: FlexibleSpaceBar(
          background: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Hello! Harris Ji", style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("What would you like to do?", style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, bottom: 30),
                child: Row(
                  
                  children: [
                     IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined, color: Colors.white, size: 35,),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/myphoto.jpg')
                )
                             
                
                  ],
                ),
              )


             
            ],
          ),
          
        ),
      )


    ]
  ),
      

    );
  }
}