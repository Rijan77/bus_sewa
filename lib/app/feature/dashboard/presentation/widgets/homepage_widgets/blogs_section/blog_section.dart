import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/blogs/blogs_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogSection extends StatefulWidget {
  final selectedType;
  const BlogSection({super.key, this.selectedType});

  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogsCubit>().fetchBlogData();
  }

  @override
  Widget build(BuildContext context) {
    //
    return BlocBuilder<BlogsCubit, BlogsState>(builder: (context, state) {
      if (state.blogStatus == ApiStatus.initial ||
          state.blogStatus == ApiStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.blogStatus == ApiStatus.failure) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.image_not_supported),
            Text(state.error ?? "Something went wrong!")
          ],
        );
      } else if (state.blogStatus == ApiStatus.success) {
        final blogs = state.blogModel;

        final Map<String, dynamic> blogMap = {
          "Bus" : "bus",
          "Tours": "tours",
          "Reservation": "reservation"
        };

        final filerBlog = widget.selectedType=="All"
        ?blogs
            :blogs.where((items)=>items.type==blogMap[widget.selectedType]);

        if (blogs.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 170,
              vertical: 40,
            ),
            child: Column(
              children: [
                Icon(Icons.error_rounded),
                Text("No blog data available")
              ],
            ),
          );
        }
        return CarouselSlider(
          items: filerBlog.map((blog) {
            return buildCarouselContainer(
                image: Image.network(
                  blog.imageUrl,
                  fit: BoxFit.cover,
                ),
                heading: blog.title,
                date: blog.date,
                description: blog.description,
                viewIcon: Icons.remove_red_eye_outlined,
                commentIcon: Icons.comment,
                viewCount: blog.viewCount,
                commentCount: blog.commentCount);
          }).toList(),
          //     buildCarouselContainer(
          //       Image.network(
          //         "https://i.pinimg.com/736x/18/34/05/1834052ffa65b61e910a3ec445887cde.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //       "Kathmandu Tour",
          //       "2024/09/10",
          //       "Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer",
          //       Icons.remove_red_eye_outlined,
          //       Icons.comment,
          //       3,
          //       12,
          //     ),
          //     buildCarouselContainer(
          //       Image.network(
          //         "https://i.pinimg.com/736x/10/a6/6b/10a66bcdcd38e1fcc65915549a19f602.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //       "New Deals in BusSewa!",
          //       "2024/09/10",
          //       "Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer",
          //       Icons.remove_red_eye_outlined,
          //       Icons.comment,
          //       3,
          //       12,
          //     ),
          //   ],
          options: CarouselOptions(
            height: 130,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.9,
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget buildCarouselContainer({
    required Image image,
    required String heading,
    required String date,
    required String description,
    required IconData viewIcon,
    required IconData commentIcon,
    required int viewCount,
    required int commentCount,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        color: const Color(0xffFEFBFF),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), child: image)),
            SizedBox(width: 10.sp),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 3.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heading, style: TextStyleWidget.blogHeading()),
                    Text(date, style: TextStyleWidget.blogDate()),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleWidget.blogDes()),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(viewIcon, size: 16),
                          SizedBox(width: 4.sp),
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
            ),
          ],
        ),
      ),
    );
  }
}
