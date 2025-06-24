
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/top_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondHeader extends StatelessWidget{
  final List<SecondHeaderItem> items;
  
  SecondHeader({super.key, required this.items});
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 230,
      child: Card(
        elevation: 2,
        color: Color(0xffFFFFFF),
        child: GridView.builder(
          itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisSpacing: 10, ),
            itemBuilder: (context, index){
            final item = items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40, width: 40, child: item.image),
                SizedBox(height: 10,),
                Text(item.label, style: TextStyle(
                  fontSize: 12,
                ),
                  textAlign: TextAlign.center,
                )

              ],
            );
            }),
      ),
    );
  
  }


}
class SecondHeaderItem{
  final Image image;
  final String label;
  
  SecondHeaderItem({required this.image, required this.label});
}