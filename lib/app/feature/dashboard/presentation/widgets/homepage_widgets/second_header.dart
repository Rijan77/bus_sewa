
import 'package:flutter/material.dart';

class SecondHeader extends StatelessWidget{
  final List<SecondHeaderItem> items;
  
  const SecondHeader({super.key, required this.items});
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 230,
      child: Card(
        elevation: 2,
        color: const Color(0xffFFFFFF),
        child: GridView.builder(
          itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisSpacing: 10, ),
            itemBuilder: (context, index){
            final item = items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40, width: 40, child: item.image),
                const SizedBox(height: 10,),
                Text(item.label, style: const TextStyle(
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