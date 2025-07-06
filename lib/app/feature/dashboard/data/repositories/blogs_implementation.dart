import 'package:bus_sewa/app/feature/dashboard/data/models/blogs_models/blog_model.dart';
import 'package:bus_sewa/app/feature/dashboard/domain/repositories/blogs_abstract.dart';
import 'package:flutter/material.dart';

class BlogImplementation implements BlogsAbstract {
  @override
  Future<List<BlogModel>> getBlogData() async {
    await Future.delayed(const Duration(seconds: 1));

    final blogData = [
      {
        'imageUrl':
            "https://i.pinimg.com/736x/18/34/05/1834052ffa65b61e910a3ec445887cde.jpg",
        'title': 'Kathmandu Tour',
        'date': '2024/09/10',
        'description':
            'Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer',
        'viewIcon': const Icon(
          Icons.remove_red_eye_outlined,
        ),
        'viewCount': 3,
        'commentIcon': const Icon(Icons.comment),
        'commentCount': 10
      },
      {
        'imageUrl':
            "https://i.pinimg.com/736x/10/a6/6b/10a66bcdcd38e1fcc65915549a19f602.jpg",
        'title': 'New Deals in BusSewa!',
        'date': '2024/09/10',
        'description':
            'Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer',
        'viewIcon': const Icon(
          Icons.remove_red_eye_outlined,
        ),
        'viewCount': 3,
        'commentIcon': const Icon(Icons.comment),
        'commentCount': 10
      },
      {
        'imageUrl':
            "https://i.pinimg.com/736x/18/34/05/1834052ffa65b61e910a3ec445887cde.jpg",
        'title': 'Kathmandu Tour',
        'date': '2024/09/10',
        'description':
            'Nestled in stunning city of Nepal, Pokhara offers stunning views of the summer',
        'viewIcon': const Icon(
          Icons.remove_red_eye_outlined,
        ),
        'viewCount': 3,
        'commentIcon': const Icon(Icons.comment),
        'commentCount': 10
      },
    ];
    return blogData.map((json) => BlogModel.fromJson(json)).toList();
  }
}
