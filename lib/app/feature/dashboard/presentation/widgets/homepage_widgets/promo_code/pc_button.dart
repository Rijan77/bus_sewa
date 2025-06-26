import 'package:flutter/material.dart';

class PcButton extends StatefulWidget {
  const PcButton({super.key});

  @override
  State<PcButton> createState() => _PcButtonState();
}

class _PcButtonState extends State<PcButton> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("All")),
          SizedBox(width: 10,),
          ElevatedButton(onPressed: (){}, child: Text("Bus")),
          SizedBox(width: 10,),
          ElevatedButton(onPressed: (){}, child: Text("Tours")),
          SizedBox(width: 10,),
          ElevatedButton(onPressed: (){}, child: Text("Reservation")),

        ],
      ),
    );
  }
}
