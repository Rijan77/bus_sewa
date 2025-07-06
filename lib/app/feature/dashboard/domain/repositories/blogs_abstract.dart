
import 'package:bus_sewa/app/feature/dashboard/data/models/blogs_models/blog_model.dart';

abstract class BlogsAbstract{
  Future<List<BlogModel>> getBlogData();
}