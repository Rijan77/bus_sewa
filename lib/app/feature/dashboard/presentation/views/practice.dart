
import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //This widget expect list of Sliver

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            toolbarHeight: 150,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/myphoto.jpg", fit: BoxFit.cover,),
              title: Text("Some Title", style: TextStyle(color: Colors.black),),
            ),
          ),
          SliverFillRemaining()

        ],

      ),

    );
  }
}
