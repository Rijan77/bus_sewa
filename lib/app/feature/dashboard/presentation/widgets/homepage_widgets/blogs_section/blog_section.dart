import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BlogSection extends StatefulWidget {
  const BlogSection({super.key});

  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        buildCarouselContainer(
          Image.network(
            "https://i.pinimg.com/736x/18/34/05/1834052ffa65b61e910a3ec445887cde.jpg",
            fit: BoxFit.cover,
          ),
          "Kathmandu Tour",
          "2024/09/10",
          "Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer",
          Icons.remove_red_eye_outlined,
          Icons.comment,
          3,
          12,
        ),
        buildCarouselContainer(
          Image.network(
            "https://i.pinimg.com/736x/10/a6/6b/10a66bcdcd38e1fcc65915549a19f602.jpg",
            fit: BoxFit.cover,
          ),
          "New Deals in BusSewa!",
          "2024/09/10",
          "Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer",
          Icons.remove_red_eye_outlined,
          Icons.comment,
          3,
          12,
        ),
      ],
      options: CarouselOptions(
        height: 130,
        enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 0.9,

      ),
    );
  }

  Widget buildCarouselContainer(
      Image image,
      String heading,
      String date,
      String description,
      IconData viewIcon,
      IconData commentIcon,
      int viewCount,
      int commentCount,
      ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        color: Color(0xffFEFBFF),
        child: Row(
          children: [
            Expanded(flex: 2, child: ClipRRect(borderRadius: BorderRadius.circular(10), child: image)),
             SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading, style: TextStyleWidget.blogHeading()),
      
                  Text(date, style: TextStyleWidget.blogDate()),
                  SizedBox(height: 5,),
                  Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyleWidget.blogDes()),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(viewIcon, size: 16),
                        const SizedBox(width: 4),
                        Text('$viewCount'),
                        const SizedBox(width: 12),
                        Icon(commentIcon, size: 16),
                        const SizedBox(width: 4),
                        Text('$commentCount'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
