part of 'blogs_cubit.dart';

class BlogsState extends Equatable {
  final ApiStatus blogStatus;
  final List<BlogModel> blogModel;
  final String? error;

  BlogsState(
      {this.blogStatus = ApiStatus.initial,
      this.blogModel = const [],
      this.error});

  BlogsState copyWith(
      {ApiStatus? blogStatus, List<BlogModel>? blogModel, String? error}) {
    return BlogsState(
        blogStatus: blogStatus ?? this.blogStatus,
        blogModel: blogModel ?? this.blogModel,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [blogStatus, blogModel, error];
}
