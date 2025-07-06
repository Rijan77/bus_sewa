import 'package:bloc/bloc.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/blogs_models/blog_model.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/blogs_implementation.dart';
import 'package:equatable/equatable.dart';

part 'blogs_state.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogsState());

  final BlogImplementation blogImplementation = BlogImplementation();

  Future<void> fetchBlogData() async {
    emit(state.copyWith(blogStatus: ApiStatus.loading));

    try {
      final List<BlogModel> modelBlog = await blogImplementation.getBlogData();
      emit(state.copyWith(blogStatus: ApiStatus.success, blogModel: modelBlog));
    } catch (e) {
      emit(state.copyWith(
          blogStatus: ApiStatus.failure, error: "Unable to Load Data"));
    }
  }
}
